# Maintainer: Nick Gilbert <nicholasgilbert2007 [at] gmail.com>
# Contributor: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=doom+doom-ii-data-steam
pkgver=1
pkgrel=1
pkgdesc="WAD data files from DOOM + DOOM II via Steam"
arch=('any')
provides=('ultimate-doom-data' 'doom2-data' 'final-doom-data')
conflicts=('ultimate-doom-data-steam' 'doom2-data-steam' 'final-doom-data-steam')
makedepends=('steamcmd')
license=('Proprietary')
url='http://store.steampowered.com/app/2280'

package() {
    mkdir -p $pkgdir/usr/share/doom/master
    mkdir -p $pkgdir/usr/share/doom/kex-resources
    # Use steamcmd to get data.
    printf "Enter your Steam username: "
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2280 validate" +quit

    # Move required files to pkgdir
    printf "Installing IWADs..."
    install -D -m 644 $srcdir/base/DOOM.WAD $pkgdir/usr/share/doom/DOOM.WAD
    install -D -m 644 $srcdir/base/doom2/DOOM2.WAD $pkgdir/usr/share/doom/DOOM2.WAD
    install -D -m 644 $srcdir/base/plutonia/PLUTONIA.WAD $pkgdir/usr/share/doom/PLUTONIA.WAD
    install -D -m 644 $srcdir/base/tnt/TNT.WAD $pkgdir/usr/share/doom/TNT.WAD
    printf " done.\nInstalling expansions..."
    install -D -m 644 $srcdir/base/master/wads/*.* $pkgdir/usr/share/doom/master/
    install -D -m 644 $srcdir/rerelease/masterlevels.wad $pkgdir/usr/share/doom/masterlevels.wad
    install -D -m 644 $srcdir/rerelease/nerve.wad $pkgdir/usr/share/doom/nerve.wad
    install -D -m 644 $srcdir/rerelease/sigil.wad $pkgdir/usr/share/doom/sigil.wad
    install -D -m 644 $srcdir/rerelease/sigil2.wad $pkgdir/usr/share/doom/sigil2.wad
    install -D -m 644 $srcdir/rerelease/id1.wad $pkgdir/usr/share/doom/id1.wad
    install -D -m 644 $srcdir/rerelease/iddm1.wad $pkgdir/usr/share/doom/iddm1.wad
    printf " done.\nInstalling extra resources..."
    install -D -m 644 $srcdir/rerelease/extras.wad $pkgdir/usr/share/doom/kex-resources/extras.wad
    install -D -m 644 $srcdir/rerelease/id1-* $pkgdir/usr/share/doom/kex-resources/
    install -D -m 644 $srcdir/rerelease/id24res.wad $pkgdir/usr/share/doom/kex-resources/id24res.wad
    printf " done.\n"
}
