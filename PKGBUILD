# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=ultimate-doom-data-steam
pkgver=1
pkgrel=1
pkgdesc="The Ultimate Doom data via Steam"
arch=('any')
provides=('ultimate-doom-data')
makedepends=('steamcmd')
license=('Proprietary')
url='http://store.steampowered.com/app/2280'

package() {
    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2280 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/base/DOOM.WAD $pkgdir/usr/share/doom/DOOM.WAD
}

