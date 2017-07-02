# Maintainer: Philippe Cherel <philippe dot cherel at mayenne dot org>
pkgname=gog-quest-for-infamy
_pkgname=quest-for-infamy
_original="Quest For Infamy"
pkgver=2.2.0.6
pkgrel=1
pkgdesc=" Quest For Infamy is a role-playing adventure game where you assume the identity of Mr. Roehm - a scoundrel who is on the run from his latest scrape. GOG Version. Linux native."
arch=('i686' 'x86_64')
url="http://www.gog.com/game/quest_for_infamy"
license=('custom')
depends_i686=('bzip2' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxpm' 'libxrender' 'libxxf86vm' 'pcre' 'zlib')
depends_x86_64=('bzip2' 'freetype2' 'gcc-libs' 'gcc-libs-multilib' 'glib2' 'glibc' 'graphite' 'harfbuzz' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxpm' 'libxrender' 'libxxf86vm' 'pcre' 'zlib')
DLAGENTS+=("gog::/usr/bin/echo Could not find %u. Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT in /etc/makepkg.conf.")
source=("gog://gog_quest_for_infamy_$pkgver.sh"
        "${pkgname}"
        "$pkgname.desktop")
PKGEXT=".pkg.tar"
sha256sums=('1f29436280cf671dede6237d067f1584d6dd085a1ac6d8d9b2d7c2839d95eff6'
            'e23d684611eec676efad1fac3764d44c2e1900cf84d0783e78602981e31f9f60'
            '4f630ef3219c083e305976325934088e6a626ecad176d6769aeba8e55404b465')

package() {
  _pkgdir="$pkgdir/opt/gog/$_pkgname"
  mkdir -p "$pkgdir"/opt/gog/$_pkgname
  cp -r data/noarch/* "$_pkgdir"
  chmod 775 "$pkgdir"/opt/gog/$_pkgname/game
  chmod 644 "$pkgdir"/opt/gog/$_pkgname/game/acsetup.cfg
  chmod 644 "$pkgdir"/opt/gog/$_pkgname/game/agsgame.dat
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 data/noarch/support/icon.png "$pkgdir/usr/share/pixmaps/hicolor/256x256/$pkgname.png"
  install -Dm644 data/noarch/docs/End\ User\ License\ Agreement.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
