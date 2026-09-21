# Maintainer: Uthopik <josearrillaga@ik.me>

pkgname=oroboros
pkgver=20260920
pkgrel=1
pkgdesc="Open source astrology software written in Python"
arch=('any')
url="https://github.com/Uthopik/oroboros-astrology"
license=('GPL-3.0-only')
depends=('python' 'python-pyqt5' 'pyswisseph' 'python-pytz' 'python-docutils')
optdepends=('limnoria: IRC bot integration support')
makedepends=('python-setuptools' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a360ec6e9b612e5cc5f053fa543c2018999660478a181839819e5a835197a398')

build() {
  cd "$pkgname-astrology-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-astrology-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Instalar los archivos de efemérides en la ruta compartida
  install -d "$pkgdir/usr/share/$pkgname/ephe"
  if [ -d "bin/ephe" ]; then
    cp -r bin/ephe/* "$pkgdir/usr/share/$pkgname/ephe/"
  fi
}
