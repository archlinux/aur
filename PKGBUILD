# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pylightxl
pkgver=1.60
pkgrel=1
pkgdesc='Minimal functionality Excel library'
arch=('any')
url='https://github.com/PydPiper/pylightxl'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
_commit='e0f9229cabba7ebf7a90621ff9e3a0d42b0bc2de'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python setup.py build
}

check() {
  cd "$pkgname"

  PYTHONPATH="$(pwd)/src:$PYTHONPATH" pytest
}

package() {
  cd "$pkgname"

  python setup.py install \
    --root="$pkgdir" \
    --optimize=1 \
    --skip-build

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
