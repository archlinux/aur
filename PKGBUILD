# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: goetzc <goetzchrist@gmail.com>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
 
pkgname=audio-recorder
pkgver=1.6.3
pkgrel=1
pkgdesc="Audio recorder for GNOME and Unity Desktops"
arch=('i686' 'x86_64')
url='https://launchpad.net/audio-recorder'
license=('GPL3')
depends=('gst-plugins-base' 'gtk3' 'libappindicator-gtk3')
makedepends=('intltool')
optdepends=('pulseaudio: for extended recording capabilities'
            'gst-plugins-good: for WAV and Flac encoding'
            'gst-plugins-bad: for AAC encoding'
            'gst-plugins-ugly: for MP3 encoding')
provides=('audio-recorder')
install="$pkgname.install"
conflicts=('audio-recorder-bzr' 'audio-recorder-from-deb')
source=("https://launchpad.net/~osmoma/+archive/ubuntu/${pkgname}/+files/${pkgname}_1.6-3%7Evivid.tar.gz"
        "fix_gtk3.16_build.patch")
md5sums=('bf01da5442b03ac39d950a238b556f93'
         '84edc83c85c82903070401274b22803c')
 
prepare() {
  cd "$srcdir/$pkgname"
  # Fix build with GTK 3.16
  # https://bugs.launchpad.net/audio-recorder/+bug/1442219
  patch -p1 < ../fix_gtk3.16_build.patch
}
 
build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}
 
package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
