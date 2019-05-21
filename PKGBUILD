pkgname=avdump2-bin
pkgver=7100
pkgrel=1
pkgdesc="AniDB video/audio codec identification utility (command line version)"
arch=('any')
url="https://wiki.anidb.net/w/Avdump2"
license=('UNKNOWN')
depends=('mono')
makedepends=('p7zip')
provides=('avdump2')
_archive="avdump2_${pkgver}.zip"
source=("https://static.anidb.net/client/avdump2/${_archive}" \
        'avdump2')
noextract=("$_archive")
md5sums=('a1539a6139315a3c0f24113bb2d2853b' 'SKIP')

prepare() {
  cd "$srcdir"
  7za -o"./$pkgver" e "$_archive"
}

package() {
  cd "$srcdir/$pkgver"
  # Unclean packaging
  rmdir "AVDump2 Build 7100 Public"
  install -m 755 -d "$pkgdir"/opt/avdump2
  install -m 644 -t "$pkgdir"/opt/avdump2 -- *
  install -Dm 755 "$srcdir"/avdump2 "$pkgdir"/usr/bin/avdump2
}
