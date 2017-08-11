# Maintainer: orumin <dev at orum.in>

pkgname=lib32-xine-lib
_basename=xine-lib
pkgver=1.2.8
pkgrel=2
pkgdesc="A multimedia playback engine (32-bit)"
arch=('x86_64')
url="http://www.xine-project.org"
license=('LGPL' 'GPL')
depends=('lib32-libxvmc' 'lib32-ffmpeg' 'lib32-libxinerama' 'xine-lib')
makedepends=('lib32-wavpack' 'lib32-faad2' 'lib32-libmng' 'lib32-imagemagick'
             'lib32-mesa' 'lib32-libmodplug' 'lib32-vcdimager' 'lib32-jack'
             'lib32-aalib' 'lib32-libdca' 'lib32-a52dec' 'lib32-libmad' 'lib32-libdvdnav'
             'lib32-libmpcdec' 'lib32-libcaca' 'lib32-libbluray' 'lib32-libvdpau'
             'lib32-glu' 'lib32-gdk-pixbuf2' 'lib32-sdl' 'lib32-smbclient')
optdepends=('imagemagick: for using the imagemagick plugin' \
            'jack: for using the jack plugin' \
            'vcdimager: for using the vcd plugin' \
            'glu: for using the opengl plugin' \
            'wavpack: for using the wavpack plugin' \
            'faad2: for using the faad plugin' \
            'libmng: for using the mng plugin' \
            'aalib: for using the aalib plugin' \
            'libmodplug: for using the modplug plugin' \
            'libdca: for using the dca plugin' \
            'a52dec: for using the a52 plugin' \
            'libmad: for using the mp3 plugin' \
            'libdvdnav: for using the dvd plugin' \
            'libmpcdec: for using the musepack plugin' \
            'libcaca: for using the caca plugin' \
            'libbluray: for using the bluray plugin' \
            'libvdpau: for using the VDPAU plugin' \
            'smbclient: for using the samba plugin' \
            'gdk-pixbuf2: for using the gdk-pixbuf plugin')
source=(https://xine-lib.alioth.debian.org/releases/xine-lib-$pkgver.tar.xz)
sha1sums=('f20115ddfced42d51feb159393607b17e6f2bdc1')

build() {
  cd ${_basename}-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --with-wavpack --enable-vdpau --with-external-dvdnav \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --disable-optimizations 
  make
}

package() {
  cd ${_basename}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}"/usr/include
  rm -r "${pkgdir}"/usr/share
}
