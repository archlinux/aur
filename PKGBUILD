# Maintainer: Max Falk <gmdfalk+aur@gmail.com>
# vim: set ts=4 sw=4 et ft=sh:

_pkgname=rcm
pkgname=${_pkgname}-git
pkgver=v1.3.0.r12.gee63185
pkgrel=1
pkgdesc="rc file (dotfiles) management"
arch=("any")
url="https://github.com/thoughtbot/$_pkgname"
license=("BSD")
makedepends=("git" "ruby-mustache")
source=("$pkgname::git+https://github.com/thoughtbot/${_pkgname}.git")
options=(!emptydirs)
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    ./autogen.sh
    ./configure \
        --disable-silent-rules \
        --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
