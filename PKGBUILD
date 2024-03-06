# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: ewolnux <thinux@gmx.fr>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: aaditya <aaditya_gnulinux@zoho.com>

pkgname=gadmin-rsync
pkgver=0.1.9
pkgrel=6
pkgdesc="An easy to use GTK2 frontend for the rsync backup client and server"
url="https://web.archive.org/web/20180720061609/http://dalalven.dtdns.net:80/linux/gadmintools-webpage"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
depends=('gtk2' 'rsync')
optdepends=("zenity: for launching with the desktop shortcut")
source=("https://github.com/sedwards/gadmintools_src_pkgs/raw/master/gadmin-rsync-0.1.9.tar.gz"
        "$pkgname.sh")
md5sums=('9ea479cdeeb5a831b9df4c8cc92faa41'
         '853ce8d2db4badef7bbe62d150d7c18e')

build() {
  cd $pkgname-0.1.9
  export CFLAGS+=" -fcommon"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make || return 1
}

package() {
# Install
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname-desktop"
  cd $pkgname-0.1.9
  make install DESTDIR="$pkgdir"
  install -Dm644 AUTHORS ChangeLog README -t "$pkgdir/usr/share/doc/$pkgname"
# Remove an unnecessary folder
  rm -dr "$pkgdir/usr/share/pixmaps/$pkgname"
# Use the script in the desktop shortcut
  sed -i 's/Exec=gadmin-rsync/Exec=gadmin-rsync-desktop/' desktop/$pkgname.desktop
  install -Dm755 desktop/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
