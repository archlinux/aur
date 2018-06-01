# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=python2-ropgadget-git
pkgver=5.4.r74.g0dc14e7
pkgrel=1
pkgdesc='Search for gadgets in your binaries to facilitate ROP exploitation - Python2 library only'
url='http://shell-storm.org/project/ROPgadget/'
arch=('any')
license=('GPL')
depends=('python2' 'python2-capstone')
makedepends=('git' 'python2-setuptools')
optdepends=()
backup=()
source=("${pkgname}::git+https://github.com/JonathanSalwan/ROPgadget.git")
md5sums=('SKIP')
provides=('python2-ropgadget-git')
conflicts=('python2-ropgadget-git')

pkgver() {
  cd "${pkgname}"
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname}"
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  rm -r "${pkgdir}/usr/bin" # Remove binaries
}

check() {
  cd ${pkgname}/test-suite-binaries
  ./test.sh
}
