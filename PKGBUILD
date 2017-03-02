# Maintainer: lithm <lithm at posteo dot de>
pkgname=xwrited
pkgver=2
pkgrel=1
pkgdesc="Display write and wall messages as desktop notifications."
arch=('i686' 'x86_64')
url="https://code.guido-berhoerster.org/projects/xwrited/"
license=('MIT')
depends=('notification-daemon' 'libutempter' 'dbus-glib')
source=("https://code.guido-berhoerster.org/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2090bf858ea7337673cd5eaac579df841a15dedf5bb14e718e6a09d4350bb48dc5c5ecc0c58948dc04de0efe473f92f5c3c872b591de45e00f9397e86aa9284f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    tail -n 23 README > LICENSE
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make prefix="${pkgdir}/usr" sysconfdir="${pkgdir}/etc" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
