# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
pkgver=0.11.2
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
sha512sums=('5e349e8deb08af9cf82122510e0e25b939f2a1000a2fd8f6607e15c36d30555e5060d9a1cb271ac13e5f2c20a69b43ab7ba3726c5ca91679992a56eded7185f8')

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
