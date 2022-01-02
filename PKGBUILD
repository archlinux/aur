# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=parsita
pkgname="python-${_pkgname}"
pkgver=1.7.0
pkgrel=2
pkgdesc="Parser combinator library for Python."
arch=('any')
url="https://pypi.org/project/parsita"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/drhagen/parsita/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('080f72c24250d2efbca2a10a388fb9ae6d040ef7bdf62cbd448fd39540ec55a0')
b2sums=('04851b52cb8386e633c5bde2c603a45dc444c84de3955b2086253b0a06f0a75c0ffcb2a7cd34c4a665686adf543a0b158c53267ac66bf8bc687654f79179aa51')

prepare() {
  cd "$_pkgname-$pkgver"

  dephell deps convert --from pyproject.toml --to setup.py
}

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
