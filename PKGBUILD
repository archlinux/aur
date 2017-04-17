pkgname=qcontrol
pkgver=0.5.5
pkgrel=1
pkgdesc="Embedded NAS peripheral controller"
arch=('any')
url="https://www.hellion.org.uk/qcontrol/"
license=("GPLv3")
depends=("lua51")
source=("https://www.hellion.org.uk/qcontrol/releases/$pkgver/$pkgname-$pkgver.tar.gz"
        "local://Makefile.patch")
sha1sums=('abed07a8eac2f04dacfb86d5149309786936ad7a'
          'd39b048fef7cfd6ae8e4657ce81a9235376b66d4')
validpgpkeys=('37BE0111')
install="$pkgname.install"
prepare() {
    cd "$pkgname-$pkgver"
    msg "Patching Makefile..."
    patch -s Makefile < "${startdir}/Makefile.patch"
    msg "Done"
}
build() {
    cd "$pkgname-$pkgver"
    msg "Starting make..."
    make
    msg "Done"
}
package() {
    cd "$pkgname-$pkgver"
    install -D -m 644 qcontrol "${pkgdir}/usr/bin/qcontrol"
    install -D -m 644 examples/* -t "${pkgdir}/etc/qcontrol.d"
    install -D -m 644 systemd/* -t "${pkgdir}/usr/lib/systemd/system/"
    ln -s "/etc/qcontrol.d/ts219.lua" "${pkgdir}/etc/qcontrol.conf"
}

