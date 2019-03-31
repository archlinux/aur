# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=final-doom-data-steam
pkgver=1
pkgrel=1
pkgdesc="Final Doom data via Steam"
arch=('any')
provides=('final-doom-data')
makedepends=('steamcmd')
license=('Proprietary')
url='http://store.steampowered.com/app/2290'

package() {
    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2290 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/base/TNT.WAD $pkgdir/usr/share/doom/TNT.WAD
    install -D -m 644 $srcdir/base/PLUTONIA.WAD $pkgdir/usr/share/doom/PLUTONIA.WAD
}

