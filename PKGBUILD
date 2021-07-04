# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
pkgver=0.11.0
pkgrel=1
pkgdesc='A linter for prose'
arch=('any')
url="https://github.com/amperser/proselint"
license=('BSD')
depends=('python-click' 'python-future' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-nose' 'python-pytest')
conflicts=('python-proselint')
replaces=('python-proselint')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('cfa12551e4c4ce6d34c0f3487cedc4ddcfb76bfa86a3ee01b1f63ef59354c8e4879bdb843ecadc2e9953d7a11cbbc65716ff5d195c670d7a80c586d31247617d')

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
