# Maintainer: Katherine Vance <katvance64@gmail.com>
# :vim 
pkgname=ambuild-git
pkgver=2.2.r8.g6ad11a1
pkgrel=2.2
pkgdesc="Allied Modders build system for sourcepawn and sourcemode extensions."
arch=("i386" "x86_64")
url="https://github.com/freylint/ambuild-aur"
license=('BSD-3-Clause')
depends=("python3" "gcc" "clang")
makedepends=("python-setuptools")
sha256sums=('SKIP')

provides=("ambuild" "ambuild2")
replaces=("ambuild" "ambuild2")
source=("$pkgname::git+https://github.com/alliedmodders/ambuild.git")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "$pkgname"
  python3 setup.py build
}

package() {
  cd "$pkgname"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
