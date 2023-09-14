_pkgname=httpx-socks
pkgname=python-$_pkgname
epoch=1
pkgver=0.7.8
pkgrel=1
pkgdesc='HTTP/SOCKS-proxy transports for httpx'
arch=('any')
url="https://github.com/romis2012/$_pkgname"
license=('Apache')
makedepends=('python-setuptools')
depends=( 'python-python-socks' 'python-httpcore' 'python-httpx')
optdepends=('python-async-timeout' 'python-trio' 'python-curio')
source=("$_pkgname-$pkgver.tgz::https://github.com/romis2012/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a4d14442e7837fd74c51b887fb4903d485d5f33ebb283c8eee7d73c664e87b5')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1 --skip-build
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$pkgname/"
}
