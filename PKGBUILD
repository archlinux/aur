# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-kiwisolver
pkgver=1.4.4
pkgrel=1
pkgdesc="A fast implementation of the Cassowary constraint solver"
url="https://github.com/nucleic/kiwi"
license=('PerlArtistic')
arch=('x86_64')
depends=('python38')
makedepends=('python38-cppy' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-runner')
source=("https://github.com/nucleic/kiwi/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9a7ed487bb28f8c430543dc21ea59156078c129fd29b1382f1578368e72f312f4e813eb4501e4c9387647b42b085b93d4bd27d0e846f1396fa4ce68fd9e9ba5f')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd kiwi-$pkgver
  python3.8 setup.py build
}

check() {
  cd kiwi-$pkgver
  PYTHONPATH="$PWD"/py \
  python3.8 setup.py pytest
}

package() {
  cd kiwi-$pkgver
  python38 setup.py install --root="$pkgdir" --optimize=1
}
