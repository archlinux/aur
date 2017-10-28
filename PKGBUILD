pkgname=bass-flac
pkgver=1.2.1
pkgrel=1
pkgdesc="Beneath a Steel Sky Enhanced Soundtrack for ScummVM"
arch=(any)
url=http://www.jameswoodcock.co.uk/content/scummvm-music-enhancement-project/beneath-a-steel-sky-enhanced-soundtrack-for-scummvm
license=(custom)
depends=(bass)
source=(http://www.jameswoodcock.co.uk/soundtracks/bass/full175618461/bass_v${pkgver//./_}_flac.zip)
sha256sums=(3d1eee157aaab63638204326f664ee889d9c173bfa6e3719c58e7c74e6145461)

package() {
  mkdir -p $pkgdir/usr/share/bass-flac/
  cp *.flac $pkgdir/usr/share/bass-flac/
  ln -rs $pkgdir/usr/share/bass/sky.{cpt,dnr,dsk} $pkgdir/usr/share/bass-flac/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp readme.txt $pkgdir/usr/share/licenses/$pkgname/

  install -D /dev/stdin $pkgdir/usr/bin/bass-flac <<EOF
#!/bin/sh

scummvm "\$@" -p /usr/share/bass-flac -e null --output-rate=44100 sky
EOF
}
