# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname="ddnsc"
pkgdesc="A simple & lightweight client to update DNS dynamically."
pkgver=2.3.0
pkgrel=1
arch=("any")
license=("GPL3")
url="https://github.com/shyaminayesh/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
backup=("etc/ddnsc/ddnsc.conf")
depends=("python>=3" "python-systemd" "python-requests")
sha256sums=("f2f55de04b08a767eaa1f2c50a797606f8b21f4c5de5334e314530cd521f8954")

package() {

    # CREATE DIRs
    install -d "$pkgdir"/usr/share/$pkgname/
    install -d "$pkgdir"/etc/$pkgname/

    # INSTALL
    install -D "$srcdir"/$pkgname-$pkgver/ddnsc.py "$pkgdir"/usr/share/$pkgname/

    # COPY REQUIRED FILES
    cp -r "$srcdir"/$pkgname-$pkgver/plugins "$pkgdir"/usr/share/$pkgname/
    cp -r "$srcdir"/$pkgname-$pkgver/helpers "$pkgdir"/usr/share/$pkgname/

    # CONFIGURATIONS
    install -Dm600 "$srcdir"/$pkgname-$pkgver/.configs/ddnsc.conf "$pkgdir"/etc/ddnsc/ddnsc.conf

    # SERVICE ( systemd )
    install -D "$srcdir"/$pkgname-$pkgver/.configs/ddnsc.service "$pkgdir"/usr/lib/systemd/system/ddnsc.service
}
