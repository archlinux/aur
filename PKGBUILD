# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-nox-poetry
_pkgname="${pkgname#python-}"
_name="${_pkgname/-/_}"
pkgver=0.8.5
pkgrel=1
pkgdesc="Use Poetry inside Nox sessions"
arch=('any')
url="https://github.com/cjolowicz/nox-poetry"
license=('MIT')
depends=('python' 'python-nox' 'python-tomlkit' 'python-packaging')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=() # TODO
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('6d383f9dcb444f99b759ce12dd69ebd609fedc3a604b57fd935d0101f377137ded22030003250b5987294ac7885dda7e62d8b5a9ecac5d7c07b7897cf53e09cb')

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
