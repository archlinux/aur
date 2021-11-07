# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
pkgver=0.13.0
pkgrel=1
pkgdesc='A linter for prose'
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
depends=('python-click' 'python-future' 'python-six')
makedepends=("python-setuptools" "python-dephell")
checkdepends=('python-mock' 'python-nose' 'python-pytest')
conflicts=('python-proselint')
replaces=('python-proselint')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('31804ad7ee90a3e250337c2c6171b6ef7bbdb0a720ac0edff98c6b774001fa503db48597fda84eb108fe97ce943ef45caa53b160084087cbf2b1b564e84fb7cb')

prepare() {
  cd "$pkgname-$pkgver"

  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd $pkgname-$pkgver

  python setup.py build
}

check() {
  cd $pkgname-$pkgver

  pytest
}

package() {
  cd $pkgname-$pkgver

  export PYTHONHASHSEED=0
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
