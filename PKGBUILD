# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Oliver Rümpelein <arch@pheerai.de>

pkgname=mergerfs
pkgver=2.32.6
pkgrel=1
pkgdesc="FUSE based union filesystem"
arch=('x86_64')
url="https://github.com/trapexit/mergerfs"
license=('custom:ISC')
# Optional makedepend: 'pandoc: to build the man page'
makedepends=('git')
optdepends=('fuse2: for mounting via fstab')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ca8592da539276d7e09533189362471898a2df32f053c6ba63e613d9153ddcec')

prepare() {
  sed -i 's|^VERSION=.*|VERSION="'$pkgver'"|' $pkgname-$pkgver/tools/update-version
}

build() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" PREFIX="/usr" SBINDIR="/usr/bin"
}

package() {
  install -Dm644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" PREFIX="/usr" SBINDIR="/usr/bin" install
}

