# Maintainer: gogamlg3
pkgname=tg-ws-proxy-cli
_name='tg-ws-proxy'
pkgver=1.8.1
pkgrel=1
pkgdesc="Local MTProto proxy server for partial bypassing of Telegram loading"
arch=(any)
url="https://github.com/Flowseal/tg-ws-proxy"
license=("MIT")
install=$_name.install
depends=(python python-cryptography)
makedepends=(python-{build,installer,wheel} python-hatchling)
source=("https://github.com/Flowseal/tg-ws-proxy/archive/refs/tags/v${pkgver}.tar.gz"
        "tg-ws-proxy-wrapper"
        "tg-ws-proxy@.service")
sha256sums=('0d9cc4cf8122eda1d333135f5930e0c8f81777f2c1b509d73f589626fb7b3404'
            '8b31b2bd47246c52c0fa85b5b423cf2d598e5139fa8250a78379bee778172d10'
            '006b1b827bb0755e50e7f05520d474d3253ac5a588353b5070aa9a27fcc860f8')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_name/"
    install -Dm755 "$srcdir/tg-ws-proxy-wrapper" "$pkgdir/usr/bin/tg-ws-proxy-wrapper"
    install -Dm644 "$srcdir/$_name@.service" "$pkgdir/usr/lib/systemd/system/$_name@.service"
}
