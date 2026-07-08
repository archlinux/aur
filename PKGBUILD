# Contributor: Andreas Baumann <mail@andreasbauman.cc>
pkgname=dos33fsprogs-git
_pkgname=dos33fsprogs
pkgver=r7190.5de5f2a3
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="http://www.deater.net/weave/vmwprod/apple/dos33fs.html"
license=('GPL2')
depends=()
optdepends=()
makedepends=('git')
source=("${_pkgname}::git+https://github.com/deater/dos33fsprogs.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/utils/dos33fs-utils"
  make

  cd "$srcdir/$_pkgname/utils/prodos-utils"
  make

  cd "$srcdir/$_pkgname/utils/asoft_basic-utils"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -d -m0755 "$pkgdir/usr/bin"

  cd "$srcdir/$_pkgname/utils/dos33fs-utils"
  make install INSTALL_LOC="$pkgdir/usr/bin"

  cd "$srcdir/$_pkgname/utils/prodos-utils"
  make install INSTALL_LOC="$pkgdir/usr/bin"

  cd "$srcdir/$_pkgname/utils/asoft_basic-utils"
  make install INSTALL_LOC="$pkgdir/usr/bin"

  cd "$srcdir/$_pkgname"
  install -d -m0755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
