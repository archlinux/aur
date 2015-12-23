# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=lives
pkgver=2.4.6
pkgrel=1
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives-video.com"
license=('GPL')
depends=('mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'liboil' 'libavc1394' 'mjpegtools' 'python' 'ffmpeg' 'jack' 'fftw')
optdepends=('xorg-utils' 'sdl' 'libogg' 'mkvtoolnix-cli' 'libmatroska' 'ogmtools' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl')
options=(!libtool)
changelog=lives.changelog
source=(http://lives-video.com/releases/LiVES-$pkgver.tar.bz2)
md5sums=('3249657af1310db812ff8bdb7e53cfe5')

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
