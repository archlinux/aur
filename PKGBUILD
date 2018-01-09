# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=compsize
pkgver=1.0
pkgrel=1
pkgdesc="Calculate compression ratio of a set of files on Btrfs"
arch=(i686 x86_64)
url="https://github.com/kilobyte/compsize"
license=(GPL)
depends=(glibc)
makedepends=(btrfs-progs git)
_commit=dfb7881aa6225c200764c69b12c7f2f59e24783a  # tags/v1.0^0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make install PREFIX="$pkgdir"
  install -Dt "$pkgdir/usr/share/man/man8" -m644 compsize.8
}
