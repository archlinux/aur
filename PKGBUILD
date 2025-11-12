# Maintainer: willemw <willemw12@gmail.com>

pkgname=mergerfs-git
pkgver=2.41.0.r1.gb6e1a08
pkgrel=1
pkgdesc='Featureful union filesystem. Combines directories from various filesystems into a storage pool'
arch=(x86_64)
url=https://github.com/trapexit/mergerfs
license=(ISC)
makedepends=(git)
#optdepends=('mergerfs-tools: manage data in a pool')
optdepends=('mergerfs-tools-git: manage data in a pool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  echo -n "$pkgver" >$pkgname/VERSION
}

build() {
  make -C $pkgname
}

package() {
  install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  make -C $pkgname DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install
}
