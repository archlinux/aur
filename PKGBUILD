# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=python-roonapi
pkgver=0.1.4
pkgrel=1
pkgdesc="Roon API wrapper written in Python (aka pyRoon)"
arch=(any)
url="https://github.com/pavoni/pyroon"
license=('APACHE')
depends=('python-websocket-client' 'python-six' 'python-requests' 'python-ifaddr')
makedepends=('python-poetry' 'mypy' 'python-black' 'python-pytest' 'python-pylint' 'flake8' 'python-pydocstyle' 'python-flake8-docstrings' 'python-flake8-quotes')
source=("pyroon-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('66dbdf7d8e6e1eddac3ee63f5107a5d57768122d48565ca26a842b824eda2bc016cd4486e750d5da7134f3d19dbeca21d9b64c3a25e11494f39e95c25357aa19')

build() {
    cd pyroon-$pkgver
	poetry config virtualenvs.create false --local
    poetry build --format wheel
}

package() {
  cd pyroon-$pkgver
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
