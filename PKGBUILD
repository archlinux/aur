# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi notify-send.py
pkgname=notify-send-py
pkgver=1.2.6
pkgrel=5
pkgdesc="A python script for sending desktop notifications from the shell"

arch=(any)
url=https://github.com/phuhl/notify-send.py
license=(MIT)
makedepends=(python-setuptools)
depends=( python-notify2 python-dbus python-gobject )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname%-*}.${pkgname##*-}/${pkgname%-*}.${pkgname##*-}-$pkgver.tar.gz"
        'notify-send.py')
sha256sums=('23f790d680221d93359bafb46b31e3af4830770cb4f0acb7c7321ab9af835b3c'
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
