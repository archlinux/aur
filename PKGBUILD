# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=lazy-ips
pkgver=20191208
pkgrel=1
pkgdesc="IPS patcher for Linux"
arch=('any')
url="https://github.com/btimofeev/lazy_ips"
license=('GPL3')
depends=('python-gobject')
makedepends=('python-setuptools' 'gendesk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/btimofeev/lazy_ips/archive/v$pkgver.tar.gz")
sha256sums=('24c8cc95aaaa72019d43ded7df3abc62669545839f61b5643cfb13a508a2cc03')

prepare() {
    gendesk -n \
            --name="Lazy IPS" \
            --pkgname="$pkgname" \
            --pkgdesc="$pkgdesc" \
            --exec=/usr/bin/lazy-ips \
            --categories='Utility;FileTools'
}

build () {
    cd "lazy_ips-$pkgver"
    python setup.py build
}

package() {
    cd "lazy_ips-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    install -Dm644 "../lazy-ips.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/lazy-ips"
}
