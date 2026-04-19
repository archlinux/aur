# Maintainer: Muhammed Emin Akalan <muhammedemin@akalan.dev>

pkgname=python-favicon
_name=favicon
pkgver=0.7.0
pkgrel=2

pkgdesc="A Python library to find a website's favicon"
arch=('any')
url="https://pypi.org/project/favicon"
license=('MIT')

depends=('python-requests' 'python-beautifulsoup4')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("https://files.pythonhosted.org/packages/source/f/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6d6b5a78de2a0d0084589f687f384b2ecd6a6527093fec564403b1a30605d7a8')

prepare() {
  cd "$_name-$pkgver"

  sed -i '/pytest-runner/d' setup.py
}

build() {
  cd "$_name-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
