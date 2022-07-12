# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-httpbin'
_module=httpbin
pkgver=0.7.0
pkgrel=3
pkgdesc="HTTP Request and Response Service (for Python 2)"
arch=('any')
url="https://github.com/requests/httpbin"
license=('MIT')
depends=(
  'python2-blinker'
  'python2-brotlipy'
  'python2-decorator'
  'python2-flasgger'
  'python2-flask'
  'python2-gevent'
  'python2-itsdangerous'
  'python2-markupsafe'
  'python2-raven'
  'python2-six'
  'python2-werkzeug'
)
makedepends=('python2-setuptools')
source=("$_module-$pkgver.tar.gz::https://github.com/requests/httpbin/archive/v$pkgver.tar.gz")
sha512sums=('faec48a0a2ac8800293b10281966a28195884ad2f69f0f28f1b8c8e1a7bfd8933ebbc9b541c80cdc19e1031a8ba9383afe8e372b9044436cb307dd1e8eddaae7')

build() {
  cd "$srcdir"/httpbin-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/httpbin-$pkgver
  python2 test_httpbin.py
}

package() {
  cd httpbin-$pkgver
  python2 setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
