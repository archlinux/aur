# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: this.ven <misgi@ven.uber.space>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=glasscoder
pkgver=2.0.1
pkgrel=1
pkgdesc='Minimalist audio encoder for IceCast, Shoutcast and HLS'
arch=(x86_64 aarch64)
url='https://github.com/ElvishArtisan/GlassCoder'
license=(GPL2)
groups=(pro-audio)
depends=(curl hicolor-icon-theme hpklinux openssl qt5-tools taglib)
makedepends=(alsa-lib flac jack docbook-xsl docbook5-xml lame libfdk-aac
             libogg libsamplerate libsndfile libvorbis libxslt opus python
             twolame)
optdepends=('lame: for MP3 output support'
            'libfdk-aac: for AAC output support'
            'libogg: for OGG Opus/Vorbis output support'
            'libvorbis: for OGG Vorbis output support'
            'opus: for OGG Opus output support'
            #'python: for rivendell integration'
            #'python-requests: for rivendell integration'
            #'rivendell: for rivendell integration'
            'twolame: for MP2 output support')
source=(https://github.com/ElvishArtisan/GlassCoder/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('dd02cb416985f299ac88635042bb473e298c7d85913052f30999e3e98bf6d7ce')

build() {
  cd $pkgname-$pkgver
  export DOCBOOK_STYLESHEETS="/usr/share/xml/docbook/xsl-stylesheets-1.79.2"
  ./configure --prefix=/usr
  make
}

package() {
  depends+=(libasound.so libjack.so libsamplerate.so libsndfile.so)
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
