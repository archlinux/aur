# Contributor: Rasi <rasi@xssn.at>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ncmpc-git
pkgver=0.24.2.g23c27e8
pkgrel=1
pkgdesc="Fully featured MPD client using ncurses" 
arch=('i686' 'x86_64')
url="http://www.musicpd.org/clients/ncmpc/"
license=('GPL2')
depends=('ncurses' 'glib2' 'libmpdclient' 'python' 'expat')
makedepends=('git' 'autoconf' 'automake')
conflicts=('ncmpc' 'ncmpc-svn')
source=("$pkgname::git+git://git.musicpd.org/master/ncmpc.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --always | sed 's/^v//g;s|-|.|g'
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-lyrics-screen \
              --with-lyrics-plugin-dir=/usr/share/ncmpc/lyrics \
              --enable-colors \
              --enable-help-screen \
              --enable-mouse \
              --enable-artist-screen \
              --enable-search-screen \
              --enable-song-screen \
              --enable-key-screen \
              --enable-lyrics-screen \
              --enable-outputs-screen \
              --enable-chat-screen
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir prefix=/usr install
  for i in lyrics/*; do install -Dm755 "$i" "${pkgdir}/usr/share/ncmpc/$i"; done
} 

