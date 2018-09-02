# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=python-decrunch-git
pkgver=0.3.0.r0.g3c75975
pkgrel=1
pkgdesc="Python wrapper around Crunch DXTc decompressor"
url="https://github.com/HearthSim/decrunch"
arch=('x86_64')
provides=('python-decrunch')
license=('ZLIB')
makedepends=('git' 'cython')
depends=('python')
optdepends=()
backup=()
source=("${pkgname}::git+https://github.com/HearthSim/decrunch.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  python setup.py build
}

package() {
  cd ${pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -DTm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
