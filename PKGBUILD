# Maintainer: Brian Bidulock <bidulock@Openss7.org>
# Contributor: OS Hazard <oshazard+aur@gmail.com>
pkgname=gtkdialog
pkgver=0.8.3
pkgrel=2
pkgdesc="A small utility for fast and easy GUI building"
arch=('i686' 'x86_64')
url="https://code.google.com/p/gtkdialog"
license=('GPL')
depends=('libglade' 'vte')
makedepends=('subversion' 'automake' 'bison' 'flex')
optdepends=('gtkdialog-examples: sample projects - pfeme, pfontview, playmusic')
provides=('gtkdialog')
conflicts=('gtkdialog')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver.tar.gz"
	"gtkdialog-0.8.3-fno-common.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/x11-misc/gtkdialog/files/gtkdialog-0.8.3-fno-common.patch?id=98692e4c4ad494b88c4902ca1ab3e6541190bbe8")
md5sums=('f8d2a2b912bcd5aa7da60984c19bc493'
         '34d2362005eea17b0b230b70a6e048ca')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -b -z .orig < ../gtkdialog-0.8.3-fno-common.patch
}

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir UPDATE_ICON_CACHE=true install
  rm -f $pkgdir/usr/share/info/dir
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  cp -a examples $pkgdir/usr/share/doc/$pkgname/examples
}

