# $Id: PKGBUILD 264515 2017-10-26 13:38:16Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: JZsolt Varadi (karmaxxl) 

pkgname=gnormalize
pkgver=0.63
pkgrel=7
pkgdesc='Audio normalizer, converter, encoder/decoder, ripper, tagger and player'
arch=('any')
url='https://gnormalize.sourceforge.net/'
license=('GPL')
depends=('cddb_get' 'gtk2-perl')
makedepends=('gendesk')
optdepends=('faac: full MP4 format'
            'flac: FLAC encoding, FLAC playing in conjunction with mplayer'
            'lame: MP3 encoding'
            'mac: full Monkeys Audio Codec support (available in the AUR)'
            'mpg123: MP3 playing'
            'mplayer: FLAC/WAV playing'
            'musepack-tools: full Musepack support'
            'perl-mp3-info: MP3 ID3 tags'
            'vorbis-tools: full OGG Vorbis support'
            'cdcd: CD playing'
            'cdparanoia: CD ripping'
            'cdrkit: CD ripping - alternative to cdparanoia'
            'wavegain: sound normalization')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('80fd9aa2da8d7fcc88bd180be2adce1aed863bedba7d715144029bd95b61ccb6')

prepare() {
  cd "$pkgname-$pkgver"

  lzma -qd gnormalize.1.lzma
  gendesk -f -n \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --mimetypes 'audio/mp3;audio/x-mp3;audio/mpeg;audio/x-mpeg;audio/x-wav;application/x-ogg'
} 

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -d "$pkgdir/usr/share/$pkgname/animations"
  install -m644 animations/*.gif "$pkgdir/usr/share/$pkgname/animations/"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 "icons/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  for i in 16 32 48 ; do
    install -Dm644 "icons/gnormalize-$i.png" \
      "$pkgdir/usr/share/icons/hicolor/${i}x$i/apps/$pkgname.png"
  done
}

# vim: ts=2 sw=2 et:
