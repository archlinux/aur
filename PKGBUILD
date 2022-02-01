# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=python-httpx-socks-ng
_name=python-httpx-socks

pkgver=0.7.3
pkgrel=3

pkgdesc='HTTP/SOCKS-proxy transports for httpx'
arch=('any')
url="https://pypi.org/project/httpx-socks"
license=('Apache')

makedepends=('python-setuptools')
depends=('python' 'python-python-socks' 'python-httpcore' 'python-httpx')
optdepends=('python-async-timeout' 'python-trio' 'python-curio')
conflicts=('python-httpx-socks')

source=("https://github.com/romis2012/httpx-socks/archive/refs/tags/v$pkgver.zip")
b2sums=('9e156c776ad777df1227e59060374bbff11b6c983eac7d031bf6781f09e74ffed3801c04aadcb499a20b093c904508496402673c70943b349db32d9bc42f5b3f')

build() {
  cd "httpx-socks-$pkgver"
  python setup.py build
}

package() {
  cd "httpx-socks-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
  install -Dm644 README.md -t"$pkgdir/usr/share/doc/$_name/"
}
