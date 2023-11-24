# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: ewolnux <thinux@gmx.fr>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: aaditya <aaditya_gnulinux@zoho.com>

pkgname=gadmin-rsync
pkgver=0.1.9
pkgrel=4
pkgdesc="An easy to use GTK+ frontend for the rsync backup client and server"
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20180720061609/http://dalalven.dtdns.net:80/linux/gadmintools-webpage"
license=('GPL3')
depends=('gtk2' 'rsync')
optdepends=("gksu: for launching with the desktop shortcut")
options=(!emptydirs)
source=("https://github.com/sedwards/gadmintools_src_pkgs/raw/master/gadmin-rsync-$pkgver.tar.gz")
md5sums=('9ea479cdeeb5a831b9df4c8cc92faa41')

build() {
  cd $pkgname-$pkgver
  export CFLAGS+=" -fcommon"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make || return 1
}

package() {
# Install
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
# Remove an unnecessary folder
  rm -dr "$pkgdir/usr/share/pixmaps/$pkgname"
# Use gksu in the desktop file
  sed -i 's/Exec=gadmin-rsync/Exec=gksu gadmin-rsync/' desktop/$pkgname.desktop
  install -Dm755 desktop/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
