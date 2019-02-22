# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake-fdkaac' 'handbrake-cli-fdkaac')
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
url="https://handbrake.fr/"
license=('GPL')
makedepends=('intltool' 'python2' 'nasm' 'wget' 'cmake' 'bzip2' 'gcc-libs' 'xz'
             'zlib' 'libnotify' 'gst-plugins-base' 'gtk3' 'dbus-glib' 'libass'
             'lame' 'libxml2' 'opus' 'libvorbis' 'libtheora' 'libsamplerate'
             'speex' 'x264' 'jansson' 'librsvg' 'libgudev')
source=(https://download.handbrake.fr/releases/$pkgver/HandBrake-$pkgver-source.tar.bz2)
sha256sums=('00316eec7bb29b88b8dd11b14581c99c35fd7a315f5bc8cc7f1eb144b2fa783d')

build() {
  cd "$srcdir/HandBrake-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-gtk-update-checks \
    --enable-fdk
  make -C build
}

package_handbrake-fdkaac() {
  pkgdesc="Multithreaded video transcoder"
  conflicts=('handbrake')
  depends=('bzip2' 'gcc-libs' 'zlib' 'gst-plugins-base' 'libnotify' 'dbus-glib'
           'gtk3' 'xz' 'libass' 'lame' 'libxml2' 'opus' 'libvorbis' 'libtheora'
           'libsamplerate' 'speex' 'x264' 'jansson' 'librsvg' 'libgudev'
           'desktop-file-utils' 'hicolor-icon-theme')
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/HandBrake-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-fdkaac() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  conflicts=('handbrake-cli')
  depends=('bzip2' 'gcc-libs' 'zlib' 'xz' 'libass' 'lame' 'libxml2' 'opus'
           'libvorbis' 'libtheora' 'libsamplerate' 'speex' 'x264' 'jansson')
  optdepends=('libdvdcss: for decoding encrypted DVDs')

  cd "$srcdir/HandBrake-$pkgver/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
