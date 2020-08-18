# Maintainer: Richard Pruitt <smoochysix4@gmail.com>

pkgname=handbrake-full-hardened
pkgver=1.3.3
pkgrel=1
pkgdesc='Multithreaded video transcoder with NVEnc, fdk-aac, qsv, x264, and x265 support - hardened.'
arch=('x86_64')
url="https://handbrake.fr/"
license=('custom: nonfree and unredistributable')
makedepends=('intltool' 'python2' 'nasm' 'wget' 'cmake' 'bzip2' 'gcc-libs' 'xz'
             'zlib' 'libnotify' 'gst-plugins-base' 'gtk3' 'dbus-glib' 'libass'
             'lame' 'libxml2' 'opus' 'libvorbis' 'libtheora' 'libsamplerate'
             'speex' 'x264' 'x265' 'jansson' 'librsvg' 'libgudev' 'numactl' 'meson')
depends=('desktop-file-utils' 'hicolor-icon-theme')
optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'libdvdcss: for decoding encrypted DVDs')
source=(https://github.com/HandBrake/HandBrake/releases/download/$pkgver/HandBrake-$pkgver-source.tar.bz2
        https://github.com/HandBrake/HandBrake/releases/download/$pkgver/HandBrake-$pkgver-source.tar.bz2.sig)
sha256sums=('218a37d95f48b5e7cf285363d3ab16c314d97627a7a710cab3758902ae877f85'
            'SKIP')
validpgpkeys+=('1629C061B3DDE7EB4AE34B81021DB8B44E4A8645') # HandBrake Team <developers@handbrake.fr>
conflicts=('handbrake')

build() {
  cd "$srcdir/HandBrake-$pkgver"

  ./configure --prefix=/usr \
  --enable-nvenc \
  --enable-fdk-aac \
  --enable-x264 \
  --enable-x265 \
  --enable-qsv \
  --harden
  
make -C build
}
  
package() {
    cd "$srcdir/HandBrake-$pkgver/build"
    
    make DESTDIR="$pkgdir" install
}
