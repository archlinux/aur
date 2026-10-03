# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=vja
pkgver=6.1.0
pkgrel=1
pkgdesc='A simple CLI for Vikunja'
arch=('any')
url='https://gitlab.com/ce72/vja'
license=('GPL-3.0-or-later')
depends=('python'
         'python-click'
         'python-click-aliases'
         'python-dateutil'
         'python-parsedatetime'
         'python-pyjwt'
         'python-requests'
        )
makedepends=('python-build'
             'python-setuptools'
             'python-wheel'
             'python-installer'
            )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('416c34e5c4eecc6f46cdfcc1db322e8d80980a94')
sha256sums=('fe53ac58f1e00420dcd0c7ce3c0caa0f127e83a8e0f5a9682cbb33ae04d7ad94')

prepare() {
  cd "$pkgname-$pkgver"
  rm -r tests/
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 noet:
