# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qbittorrent-api
pkgname="python-$_pkgname"
pkgver=2022.8.38
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rmartin16/qbittorrent-api/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('43a0d56a66834efb349e7b26b7bba89d803513f4479481e9ac6b033e2513ee91')
b2sums=('33ecc9e300337976bb893812d0e34eb2b08f481ca3afc60db8d75ecfa1cd2c79a37d0ea892f5dd55b43ade327f458294525290c16805bf60070f04214f882e87')

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
