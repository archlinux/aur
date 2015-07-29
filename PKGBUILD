# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=moka-icon-theme
pkgname=${_pkgname}-git
pkgver=382.669c2ae
pkgrel=1
pkgdesc="An icon theme designed with a minimal, flat style, using simple geometry & colours."
arch=('any')
url="http://mokaproject.com/moka-icon-theme/"
license=('GPL3')
depends=('faba-icon-theme-git' 'faba-mono-icons-git' 'gtk-update-icon-cache')
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
    install -d -m 755 "${pkgdir}"/usr/share/icons/Moka
    cp -dr --no-preserve=ownership "${_pkgname}"/Moka "${pkgdir}"/usr/share/icons/
    find "${pkgdir}"/usr/share/icons/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/icons/ -type f -exec chmod 644 {} \;
}
