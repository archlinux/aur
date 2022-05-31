# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qbittorrent-api
pkgname="python-$_pkgname"
pkgver=2022.5.32
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rmartin16/qbittorrent-api/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee9482c8fc23b21d16ecf45921f1bf41fafa58af300b8bb11e03779db6e99cbb')
b2sums=('6b88b0435742559c5051ecda3ece69ed1d069eb6db6a20b7426e384e96cd0a121f4ca9eb9511d384894b266ae64e11e3b84311dc3d181cac23c21fde468597a3')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"

  export PYTHONPATH="build/lib"
  python setup.py test
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
