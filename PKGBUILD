# Maintainer: Max Falk <gmdfalk+aur@gmail.com>
# vim: set ts=4 sw=4 et ft=sh:

_pkgname=rcm
pkgname=${_pkgname}-git
pkgver=r184.fbb301d
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
