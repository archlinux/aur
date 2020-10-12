# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=gog-unreal-tournament-goty
pkgver=2.0.0.5
pkgrel=3
pkgdesc="Unreal Tournament (99): Game of the Year Edition. GOG Version."
arch=('x86_64')
url="https://www.gog.com/game/unreal_tournament_goty"
license=('custom')
depends=('lib32-sdl'
         'lib32-libgl')
makedepends=('innoextract')
source=("setup_ut_goty_$pkgver.exe::gogdownloader://unreal_tournament_goty/en1installer0"
        "https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v469a/OldUnreal-UTPatch469a-Linux.tar.bz2"
        "gog-unreal-tournament-goty")
noextract=("ut99v451-linux.tar.gz")
sha256sums=("4cc257d54d97659c5062f2bf186d0a8c6959561d11e42d8fcf2eac07f1926803"
            "d521a8339b80a4c86019c3648fb55cfc29edffeec73047ceb72784b159cc84f1"
            "2b70aa7a20d5b1fbfaf9561bd3cfc8c1d0f0dee2212b3914aed30a7c75e40566")
DLAGENTS+=("gogdownloader::/usr/bin/echo %u Download the GOG file to \"$PWD\" or set up a gogdownloader:// DLAGENT.")

prepare() {
  # extract gog installer
  innoextract -em -d $srcdir setup_ut_goty_${pkgver}.exe
  # extract extra linux files
  tar -xf OldUnreal-UTPatch469a-Linux.tar.bz2 -C app
}

package() {
  # make destination directory
  mkdir -p $pkgdir/opt/gog/$pkgname
  # copy game files
  cp -r app/* $pkgdir/opt/gog/$pkgname
  # copy runner to /usr/bin
  install -D -m 755 $pkgname $pkgdir/usr/bin/$pkgname
}
