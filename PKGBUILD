# Maintainer: N Fytilis <n-fit AT live.com>
_pkgbase=ntfs2btrfs
pkgname=$_pkgbase-git
pkgbase=$_pkgbase-git
pkgver=r220.7664363
pkgrel=1
epoch=
pkgdesc="Convertion from ntfs to btrfs keeping NT metadata"
arch=(any)
url=""
license=('GPL')
depends=(fmt)
makedepends=(cmake gcc)
source=("git+https://github.com/maharmstone/ntfs2btrfs")
md5sums=(SKIP)

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgbase"
  mkdir b || true
  cd b
  cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
  make
}

package() {
  cd "$_pkgbase/b"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/sbin $pkgdir/usr/bin
}
