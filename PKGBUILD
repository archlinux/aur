# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=dbench-git
pkgver=20130101
pkgrel=1
pkgdesc='A filesystem benchmark based on load patterns'
arch=('i686' 'x86_64')
url='http://dbench.samba.org/'
license=('GPL3')
depends=('smbclient')
makedepends=('git')
source=('git://git.samba.org/sahlberg/dbench.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git log -1 --format='%cd' --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/${pkgname%-git}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
} 
