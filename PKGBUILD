# Maintainer: James Bunton <jamesbunton@delx.net.au>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=('handbrake-fdkaac' 'handbrake-cli-fdkaac')
pkgver=1.0.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://handbrake.fr/"
license=('GPL')
makedepends=('intltool' 'python2' 'yasm' 'wget' 'bzip2' 'gcc-libs' 'libnotify'
             'gst-plugins-base' 'gtk3' 'dbus-glib' 'fribidi' 'libass' 'lame'
             'fontconfig' 'freetype2' 'libxml2' 'libogg' 'libvorbis' 'cmake'
             'libtheora' 'libsamplerate' 'x264' 'libx264' 'jansson' 'librsvg'
             'libgudev')
source=(https://handbrake.fr/mirror/HandBrake-$pkgver.tar.bz2)
sha256sums=('18e4563cc150309df03f7e73462b823ba2eca61644a7a536c9930611f3f9aa1e')

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
  depends=('bzip2' 'gcc-libs' 'gst-plugins-base' 'libnotify' 'dbus-glib'
           'fribidi' 'libass' 'lame' 'gtk3' 'fontconfig' 'freetype2' 'libxml2'
           'libogg' 'libvorbis' 'libtheora' 'libsamplerate' 'libx264' 'jansson'
           'librsvg' 'libgudev' 'desktop-file-utils' 'hicolor-icon-theme')
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews')

  cd "$srcdir/HandBrake-$pkgver/build"

  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/bin/HandBrakeCLI"
}

package_handbrake-cli-fdkaac() {
  pkgdesc="Multithreaded video transcoder (CLI)"
  conflicts=('handbrake-cli')
  depends=('bzip2' 'gcc-libs' 'zlib' 'fribidi' 'libass' 'lame' 'libxml2'
           'libtheora' 'libsamplerate' 'libx264' 'jansson')

  cd "$srcdir/HandBrake-$pkgver/build"
  install -D HandBrakeCLI "$pkgdir/usr/bin/HandBrakeCLI"
}

# vim:set ts=2 sw=2 et:
