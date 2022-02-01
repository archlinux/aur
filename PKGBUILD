# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-httpx-socks-ng
_name=python-httpx-socks

pkgver=0.7.3
pkgrel=1

pkgdesc='HTTP/SOCKS-proxy transports for httpx'
arch=('any')
url="https://pypi.org/project/httpx-socks"
license=('Apache')

makedepends=('python-setuptools')
depends=('python' 'python-python-socks' 'python-httpcore>=0.14' 'python-httpx>=0.21' 'python-httpx<0.22')
optdepends=('python-async-timeout' 'python-trio' 'python-curio')
conflicts=('python-httpx-socks')

source=("https://github.com/romis2012/httpx-socks/archive/refs/tags/v$pkgver.zip")
sha512sums=('23124013ed21cb93fcb2facd70e8178acbb5c6cc062a35257bfe167a04045c18e66e3727421dbd9a9c947d8db5770eaf78b739eef307aa5e858a41e9c6381c78')

build() {
  cd "httpx-socks-$pkgver"
  python setup.py build
}

package() {
  cd "httpx-socks-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
}
