# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: notify-send.py

pkgname=notify-send-py
pkgver=1.2.7
pkgrel=1
pkgdesc="A python script for sending desktop notifications from the shell"

arch=(any)
url=https://github.com/phuhl/notify-send.py
license=(MIT)
makedepends=(python-setuptools)
depends=( python-notify2 python-dbus python-gobject )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname%-*}.${pkgname##*-}/${pkgname%-*}.${pkgname##*-}-$pkgver.tar.gz"
        'notify-send.py')
sha256sums=('f68959449f6ad66c75846a946a5e97765657eafe6efc7d4ffd4a95622c3d9663'
            'e07e3213316a8eb3b4e3d952898075bb8a0db2edde7819770b7524d7bc592a91')

build() {
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py build
}

package()
{
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm755 "$srcdir/notify-send.py" "$pkgdir/usr/bin/notify-send.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
