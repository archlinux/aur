# Maintainer: Christoph Schmidpeter <christoph dot schmidpeter at gmx dot de>
# Contributor: Philippe Cherel <philippe dot cherel at mayenne dot org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=gog-baldurs-gate-2-enhanced-edition
_pkgname=baldurs-gate-2-enhanced-edition
_original="Baldurs Gate 2 Enhanced Edition"
pkgver=2.6.0.10
pkgrel=1
pkgdesc="Your story begins anew in the exotic southern kingdom of Amn, amidst the opulence of the sinister capital city of Athkatla. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/baldurs_gate_2_enhanced_edition"
license=('custom')
depends_i686=('glibc' 'alsa-lib' 'libgl' 'libxcb')
depends_x86_64=('lib32-glibc' 'lib32-alsa-lib' 'lib32-libgl' 'lib32-libxcb')
optdepends_i686=('libpulse: pulseaudio support')
optdepends_x86_64=('lib32-libpulse: pulseaudio support')
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")
source=("gog://gog_baldur_s_gate_2_enhanced_edition_$pkgver.sh"
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('f123b2482c169c81d52c93513c4659db3ed376c2781401d24b65ce08d49747e9'
            '55e56f5c3e4b03a3dfa70ad66e85b5cdac229baa7fc72775fd77a6962ea68ca7'
            '082330f67a7a6aa4ecc4d2f71765f12224f03260edff82e42d7622fd5084c14d')
PKGEXT=".pkg.tar"


package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -r data/noarch/* "$pkgdir/opt/$pkgname"
  # Remove packaged libraries that result in the game not starting
  rm "$pkgdir/opt/$pkgname/lib/libstdc++.so.6"
  rm "$pkgdir/opt/$pkgname/lib/libxcb.so.1"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
