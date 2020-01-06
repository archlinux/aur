# Maintainer: Shyamin Ayesh <me@shyamin.com>

pkgname="ddnsc"
pkgdesc="A simple & lightweight client to update DNS dynamically."
pkgver=2.2.1
pkgrel=5
arch=("any")
license=('GPL3')
url="https://github.com/shyaminayesh/$pkgname"
source=("$url/archive/v$pkgver.tar.gz")
backup=('etc/ddnsc/ddnsc.conf')
depends=("python>=3" "python-systemd" "python-requests")
sha256sums=("734ad52f9da90dab86a7b8f98fde10a72ea6f8b3c79d8af073c05625283d45b8")
validpgpkeys=('202164AC7B099EC3C4ECD161FC3F05FA01F8DD0E')

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
