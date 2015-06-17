# Mantainer: M0Rf30

pkgname=unrealtournament-rocketarena
pkgver=1.6
pkgrel=1
pkgdesc="The popular Rocket Arena gametype also for UT1999."
arch=('i686' 'x86_64')
url="http://www.moddb.com/mods/rocket-arenaut"
license=('custom')
groups=(unrealtournament unrealtournament-bonuspacks)
depends=(unrealtournament-bonuspack3)
makedepends=(umodunpack)
optdepends=("unrealtournament-bonuspack1: requires ServerPackages=RocketArenaMultiMesh setting")
install=install.sh
source=(rocketarena-$pkgver.zip::'http://www.ut-files.com/index.php?dir=GameTypes/RocketArena/&file=rocketarenautfull160.zip'
        install.sh)
md5sums=('66569b63e630690e9ca5b22722b4a548'
         'dfb1f79f67027be07df189d41e3a2422')

build() {
    cd "$srcdir"

    install --mode=0644 -D RocketArenaReadme.txt \
            "$pkgdir/opt/ut/Help/RocketArenaReadme.txt"
    umodunpack --base "$pkgdir/opt/ut" --unpack \
            RocketArenaUTFull160.umod || return 1
    umodunpack --base "$pkgdir/opt/ut" --unpack \
            RocketArenaUTBonusPack160.umod || return 1
    find "$pkgdir/opt/ut" -type d -exec chmod 755 '{}' \;
    find "$pkgdir/opt/ut" -type f -exec chmod 644 '{}' \;

    ## xutfx.utx is also in unrealtournament-bonuspack3. Thus remove it and depend
    ## on that package.
    rm -f -- "$pkgdir/opt/ut/Textures/xutfx.utx" || return 1
}

