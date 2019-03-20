# Maintainer: Joffrey <j-off@live.fr>

pkgname='python2-qrcode'
pkgver=6.1
pkgrel=1
pkgdesc='Python library to generate QR codes'
url='https://github.com/lincolnloop/python-qrcode'
arch=('any')
license=('BSD')
depends=('python2-pillow' 'python2-six' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('eaa5722f0d7d717293953e5542b98d953d3d4a64c77c65b5450c20ada88b98e5')

prepare() {
    cd "python-qrcode-$pkgver"

    # Fix conflicts with python3 module
    mv ./doc/qr.1 ./doc/qr2.1
    sed 's|doc/qr.1|doc/qr2.1|' -i ./setup.py
    sed 's|qr =|qr2 =|' -i ./setup.cfg
}

package() {
    cd "python-qrcode-$pkgver"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python2 ./setup.py install --root="$pkgdir" --optimize=1
}
