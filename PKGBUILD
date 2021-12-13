# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.9.0
pkgrel=2
pkgdesc="Use Poetry inside Nox sessions"
arch=('any')
url="https://github.com/cjolowicz/nox-poetry"
license=('MIT')
depends=('python' 'python-nox' 'python-tomlkit' 'python-packaging' 'python-poetry')
makedepends=('python-setuptools' 'python-dephell')
#checkdepends=('python-pytest' 'python-pytest-datadir' 'python-pygments' 'python-typing_extensions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9bf7f6a1c62ebbc26356a7270b068a25d5a841ab36a7d2b669cf618147344b24556fa444c6ea9c9a6d8d4963dbd70f0897ca012ed72e2750cd9646bb4adc97cc')
b2sums=('677fe229c0c0c58b4c08cc67f1978ad7f2b455de566df2cbb372c0eacea7d585a7f9278f638e7d11e920b6df88c0099950eaa6fedfa969dc5421a4bb81d877f7')

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
