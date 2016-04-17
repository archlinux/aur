# Maintainer: aksr <aksr at t-com dot me>
pkgname=backupfs-git
pkgver=r11.6365b8d
pkgrel=1
epoch=
pkgdesc="A network extended command level clone of the Plan 9 dump file system."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/backupfs/"
url="https://github.com/hariguchi/backupfs"
license=('BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('backupfs')
replaces=()
backup=()
options=()
changelog=
install=${pkgname%-*}.install
source=("$pkgname::git+https://github.com/hariguchi/backupfs.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '173,183'd Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,/share/man}
  make PREFIX="$pkgdir/usr" TGTGRP="root" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 cron.daily-backup.sh $pkgdir/usr/share/doc/$pkgname/cron.daily-backup.sh
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 BUGS $pkgdir/usr/share/doc/$pkgname/BUGS
}

