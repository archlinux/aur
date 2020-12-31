# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# pkg: pypi notify-send.py
pkgname=notify-send-py
pkgver=1.2.6
pkgrel=3
pkgdesc="A python script for sending desktop notifications from the shell"

arch=(any)
url=https://github.com/phuhl/notify-send.py
license=(MIT)
makedepends=(python-setuptools)
depends=( python-notify2 python-dbus python-gobject )
_python="$(realpath /usr/bin/python|xargs basename)"

source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname%-*}.${pkgname##*-}/${pkgname%-*}.${pkgname##*-}-$pkgver.tar.gz")
sha256sums=('23f790d680221d93359bafb46b31e3af4830770cb4f0acb7c7321ab9af835b3c')
build() {
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py build
}

package()
{
    cd "$srcdir/${pkgname%-*}.${pkgname##*-}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    chmod +x \
    "$pkgdir/usr/lib/${_python}/site-packages/notify_send_py/notify_send_py.py"
	mkdir -p "$pkgdir/usr/bin"
    ln -s "../lib/${_python}/site-packages/notify_send_py/notify_send_py.py" "$pkgdir/usr/bin/notify-send.py"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
