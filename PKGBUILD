# Maintainer: qtlis <qtlis plus aur at posteo dot de>
pkgname=xwrited
pkgver=3
pkgrel=1
pkgdesc="Display write and wall messages as desktop notifications."
arch=('i686' 'x86_64')
url="https://code.guido-berhoerster.org/projects/xwrited/"
license=('MIT')
depends=('notification-daemon' 'libutempter' 'dbus-glib')
makedepends=('intltool')
source=("https://code.guido-berhoerster.org/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")
sha512sums=('743e04f8ea57ed3b769db80a49d927d56a01f12f14df61c9159f9fc8d8454e5f2510c718faba3cec01aea4d1a585c06f0a5398244891bc48105f55a31aeb84a4')

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
