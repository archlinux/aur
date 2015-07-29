# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=moka-gtk-theme
pkgname=${_pkgname}-git
pkgver=139.306bc82
pkgrel=2
pkgdesc="An accompanying GTK theme for the Moka icon set."
arch=('any')
url="https://github.com/moka-project/${_pkgname}"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
options=(!strip)
source=(${_pkgname}::"git+https://github.com/moka-project/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    # Moka-Dark is not supported or developed.
    install -d -m 755 "${pkgdir}"/usr/share/themes/Moka
    cp -dr --no-preserve=ownership "${_pkgname}"/Moka "${pkgdir}"/usr/share/themes/
    find "${pkgdir}"/usr/share/themes/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/themes/ -type f -exec chmod 644 {} \;
}
