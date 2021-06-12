# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.8.6
pkgrel=1
pkgdesc="Use Poetry inside Nox sessions"
arch=('any')
url="https://github.com/cjolowicz/nox-poetry"
license=('MIT')
depends=('python' 'python-nox' 'python-tomlkit' 'python-packaging' 'python-poetry')
makedepends=('python-setuptools' 'python-dephell')
#checkdepends=('python-pytest' 'python-pytest-datadir' 'python-pygments' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('2e92e818632c68d3edc9cd10847a2cc02f6ccd9dcafebdcab6417ae5a0e2c8844f82062e1682c5537cc41deb4bac794874289ef7ba5ba1d9fd4a04a0a806590f')

prepare() {
  cd "$_pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
