# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-noiseprotocol-git
_pkgname=noiseprotocol
pkgver=0.3.1.r0.g7337544
pkgrel=2
pkgdesc="A Python implementation of Noise Protocol Framework"
arch=('any')
depends=('python' 'python-cryptography')
makedepends=('python-setuptools' 'python-pytest' 'git')
url="https://github.com/plizonczyk/noiseprotocol"
license=('MIT')
options=('!emptydirs')
source=(git+https://github.com/plizonczyk/noiseprotocol.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check(){
  cd "$srcdir/$_pkgname"
  pytest
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
