# Maintainer: Clemmitt Sigler <cmsigler (dot) online (at) gmail (dot) com>

pkgname=dvd-slideshow
pkgver=0.8.6
pkgrel=3
pkgdesc="Scripts for creating slideshow DVDs with menus, audio, and fancy effects."
arch=('any')
url="http://dvd-slideshow.sourceforge.net"
license=('GPL')
depends=('dvdauthor>0.6.11' 'imagemagick>5.5.4' 'sox>14' 'ffmpeg' 'mjpegtools' 'cdrtools' 'bc' 'jhead')
optdepends=('lame: MP3 audio support'
            'vorbis-tools: Ogg audio support'
            'faad2: m4a audio support'
            'vcdimager: vcd/svcd .cue, .bin support'
            'toolame: Faster mpeg2 audio encoding'
            'graphicsmagick: Alternative to imagemagick'
            'perl-image-exiftool: Alternative to jhead'
            'gsfonts: URW fonts')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-1.tar.gz"
        "dvd-slideshow_ffprobe.patch"
        "dir2slideshow_exiftool.patch"
        "dvd-slideshow_soxi_-D.patch")
sha1sums=('383f4e6ee33e8c344ccc484f61dd868c714b49dd'
          'a96c72392d0dafe19cd93127bfaf70abd1ffa6ed'
          'ae1bf3490fdc78a8e00c0b5c86bdeaaf3cc09a2d'
          '1a827b5f308f50e376c2d1cf04ca03e77cfa2e98')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-1"
  patch -p1 -i "${srcdir}"/dvd-slideshow_ffprobe.patch
  patch -p1 -i "${srcdir}"/dir2slideshow_exiftool.patch
  patch -p1 -i "${srcdir}"/dvd-slideshow_soxi_-D.patch
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-1"

  for _file in `ls man | sed 's/\.1//'`; do
    install -Dm755 $_file "${pkgdir}/usr/bin/$_file"
    install -Dm644 man/$_file.1 "${pkgdir}/usr/share/man/man1/$_file.1"
    install -Dm644 doc/$_file.html "${pkgdir}/usr/share/doc/$pkgname/$_file.html"
  done

  install -Dm644 "${pkgname}rc" "${pkgdir}/usr/share/$pkgname/${pkgname}rc"
}
