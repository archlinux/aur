# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: AAAEE882

pkgname=flacgain
pkgver=0.2
pkgrel=5
pkgdesc="FLAC Replay Gain script similar to mp3gain and vorbisgain that uses metaflac."
arch=('any')
url="http://projects.robinbowes.com/apply_replaygain/trac"
license=('GPL')
depends=('perl' 'flac')
source=(http://projects.robinbowes.com/download/apply_replaygain/apply_replaygain-${pkgver}.tar.gz
        help.patch)
sha512sums=('46dcd81631a14c4b2fe873f01a29e8fa87d43eed7f37f9c663e1f9a99b9c00952873b68023640994ef513ff6841814ec4d9c1291fde7f7c23206d12896fd5fe8'
            '55ac98f4ec1b285a7c2c5ce331abfaf076c6db2b9d5a765ce92cb647f33bd4d9b57b8f3f70fc241ba1619496e4790bf7a9c6c927d45a7b826c08b87ddd83853b')

package() {
  cd "$srcdir"
  tar xfz apply_replaygain-$pkgver.tar.gz
  cd "$srcdir/apply_replaygain-$pkgver"
  patch apply_replaygain.pl ../../help.patch
  install -D -o root -g root -m 755 apply_replaygain.pl ${pkgdir}/usr/bin/flacgain
  mkdir -p ${pkgdir}/usr/lib/perl5/vendor_perl/
  mv lib/Audio ${pkgdir}/usr/lib/perl5/vendor_perl/
  chown root:root -R ${pkgdir}/usr/lib/perl5/vendor_perl/Audio
}

# vim:set ts=2 sw=2 et:
