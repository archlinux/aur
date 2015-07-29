# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=faba-icon-theme
pkgname=${_pkgname}-git
pkgver=294.ab92a4c
pkgrel=2
pkgdesc="This is the base icon set for Faba. It is designed with simplicity and compliance to standards in mind."
arch=('any')
url="http://mokaproject.com/faba-icon-theme/"
license=('GPL3')
depends=('gtk-update-icon-cache')
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
    install -d -m 755 "${pkgdir}"/usr/share/icons/Faba
    cp -dr --no-preserve=ownership "${_pkgname}"/Faba "${pkgdir}"/usr/share/icons/
    find "${pkgdir}"/usr/share/icons/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/icons/ -type f -exec chmod 644 {} \;
}
