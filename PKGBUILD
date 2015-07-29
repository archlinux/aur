# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=faba-mono-icons
pkgname=${_pkgname}-git
pkgver=94.560b521
pkgrel=1
pkgdesc="The monochromatic panel icon sets for Faba."
arch=('any')
url="http://mokaproject.com/faba-icon-theme/"
license=('GPL3')
depends=('faba-icon-theme-git' 'gtk-update-icon-cache')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
options=(!strip)
source=(${_pkgname}::"git+https://github.com/moka-project/${_pkgname}.git")
sha256sums=('SKIP')
install=${_pkgname}.install

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    install -d -m 755 "${pkgdir}"/usr/share/icons/{Faba-Mono,Faba-Mono-Dark}
    cp -dr --no-preserve=ownership "${_pkgname}"/{Faba-Mono,Faba-Mono-Dark} "${pkgdir}"/usr/share/icons/
    find "${pkgdir}"/usr/share/icons/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/icons/ -type f -exec chmod 644 {} \;
}
