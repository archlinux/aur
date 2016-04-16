# Maintainer: aksr <aksr at t-com dot me>
pkgname=backupfs
pkgver=1.0beta10
pkgrel=1
epoch=
pkgdesc="A network extended command level clone of the Plan 9 dump file system."
arch=('i386' 'x86_64')
url="https://sourceforge.net/projects/backupfs/"
license=('BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('backupfs-git')
replaces=()
backup=()
install=${pkgname}.install
changelog=
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
options=()
noextract=()
md5sums=('ad488ee255c5aad28fd987a28913f296')
sha1sums=('edd01eb43f5c0ba04ab143c72ae38ea9229cd0aa')
sha256sums=('c610a35b3a8e1d0c8b9fdbda33c6e7049d865bf4beafe3c5a90e253a97410168')

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '156,164'd Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make CC='gcc -m32'
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,/share/man}
  make PREFIX="$pkgdir/usr" TGTGRP="root" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 cron.daily-backup.sh $pkgdir/usr/share/doc/$pkgname/cron.daily-backup.sh
  install -Dm644 INSTALL $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 BUGS $pkgdir/usr/share/doc/$pkgname/BUGS
}

