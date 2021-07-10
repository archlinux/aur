# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
pkgver=0.11.3
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
sha512sums=('b54782188cd9e8f591c8defed4c6fb36884404f9956420fa634cc3e99e2705a480f13a23d4c5ba5eb29b0fedf2ac856bf5dc59c3ad30f1f106a0948775f5691e')

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
  install -Dm644 proselint/.proselintrc "$pkgdir/usr/lib/python3.9/site-packages/proselint/.proselintrc"
}
