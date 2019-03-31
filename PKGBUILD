# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=doom2-data-steam
pkgver=1
pkgrel=1
pkgdesc="Doom 2 data via Steam"
arch=('any')
provides=('doom2-data')
makedepends=('steamcmd')
license=('Proprietary')
url='http://store.steampowered.com/app/2300'

package() {
    cd $srcdir

    # Use steamcmd to get data.
    mkdir -p $srcdir/tmp
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/tmp +login $steam_username "+app_update 2300 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/tmp/base/DOOM2.WAD $pkgdir/usr/share/doom/DOOM2.WAD
}

