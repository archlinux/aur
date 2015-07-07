# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=lives
pkgver=2.2.8
pkgrel=1
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives.sourceforge.net"
license=('GPL')
depends=('mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'liboil' 'libavc1394' 'mjpegtools' 'python' 'ffmpeg' 'ffmpeg-compat' 'jack' 'fftw')
optdepends=('xorg-utils' 'sdl' 'libogg' 'mkvtoolnix-cli' 'libmatroska' 'ogmtools' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl')
options=(!libtool)
changelog=lives.changelog
source=(http://www.xs4all.nl/%7Esalsaman/lives/current/LiVES-$pkgver.tar.bz2)
md5sums=('8440e2a2b6e83655dfc39c9fef5ee903')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # /bin/touch -> /usr/bin/touch
  find -type f -exec sed -i 's:/bin/touch:/usr&:g' {} \;
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  rm "$pkgdir"/usr/bin/lives
  ln -s /usr/bin/lives-exe "$pkgdir"/usr/bin/lives
}
