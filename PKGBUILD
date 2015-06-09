# Maintainer: John Lane <archlinux at jelmail dot com>

pkgname=dvd95-git
pkgver=r90.01dd592
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A gnome application to convert DVD9 to DVD5"
url="http://dvd95.sourceforge.net/"
license="GPL"
depends=('cairo' 'cdrkit' 'ffmpeg' 'libgnomeui' 'libdvdread' 'mplayer' 'mencoder' 'intltool' 'libmpeg2')
makedepends=('gcc' 'make')
optdepends=('vlc: video playback and preview')
source=("$pkgname::git+http://git.code.sf.net/p/dvd95/code")
md5sums=('SKIP')
provides=('dvd95')
conflicts=('dvd95')

build() {
  cd $srcdir/$pkgname

  autoreconf --force --install

  export LIBS+=" -lxml2"
  ./configure --prefix=/usr

  make || return 1
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
