# Maintainer: lithm <lithm at posteo dot de>
pkgname=xwrited-hg
pkgver=2.r18.4a5330979433
_pkgver=2
pkgrel=3
pkgdesc="Display write and wall messages as desktop notifications."
arch=('i686' 'x86_64')
url="https://code.guido-berhoerster.org/projects/xwrited/"
license=('MIT')
depends=('notification-daemon' 'libutempter' 'dbus-glib')
makedepends=('intltool' 'mercurial')
provides=('xwrited')
conflicts=('xwrited')
source=("${pkgname}::hg+https://hg.guido-berhoerster.org/projects/xwrited/")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s.r%s.%s" ${_pkgver} "$(hg identify -n)" "$(hg identify -i)"
}

build() {
    cd "${srcdir}/${pkgname}"
    tail -n 23 README > LICENSE
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make prefix="${pkgdir}/usr" sysconfdir="${pkgdir}/etc" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
