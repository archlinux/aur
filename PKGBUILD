# Maintainer: Zacharias Knudsen <zachasme@gmail.com>
pkgname=gog-unreal-tournament-goty
pkgver=2.0.0.5
pkgrel=2
pkgdesc="Unreal Tournament (99): Game of the Year Edition. GOG Version."
arch=('x86_64')
url="https://www.gog.com/game/unreal_tournament_goty"
license=('custom')
depends=('lib32-sdl')
makedepends=('innoextract')
source=("setup_ut_goty_$pkgver.exe::gogdownloader://unreal_tournament_goty/en1installer0"
        "https://www.dotslashplay.it/ressources/unreal-tournament/ut99v451-linux.tar.gz"
        "gog-unreal-tournament-goty")
noextract=("ut99v451-linux.tar.gz")
sha256sums=("4cc257d54d97659c5062f2bf186d0a8c6959561d11e42d8fcf2eac07f1926803"
            "bb32a2414f5484aa3672673819add54ceac30ff5bcb387e6c6dc617ccc95ac29"
            "2b70aa7a20d5b1fbfaf9561bd3cfc8c1d0f0dee2212b3914aed30a7c75e40566")
DLAGENTS+=("gogdownloader::/usr/bin/echo %u Download the GOG file to \"$PWD\" or set up a gog:// DLAGENT.")

prepare() {
  # extract gog installer
  innoextract -em -d $srcdir setup_ut_goty_${pkgver}.exe
  # extract extra linux files
  tar -xzf ut99v451-linux.tar.gz -C app
}

package() {
  # make destination directory
  mkdir -p $pkgdir/opt/gog/$pkgname
  # copy game files
  cp -r app/* $pkgdir/opt/gog/$pkgname
  # copy runner to /usr/bin
  install -D -m 755 $pkgname $pkgdir/usr/bin/$pkgname
}
