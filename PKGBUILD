# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=('quake3-data-steam' 'quake3-ta-data-steam')
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Quake 3 Arena data via Steam"
makedepends=('steamcmd')
license=('Proprietary')
url='http://store.steampowered.com/app/2200'

package_quake3-data-steam() {
    provides=('quake3-data')

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2200 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/baseq3/pak0.pk3 $pkgdir/opt/quake3/baseq3/pak0.pk3
}

package_quake3-ta-data-steam() {
    pkgdesc="Quake 3 Team Arena data via Steam"
    provides=('quake3-ta-data')
    depends=('quake3-data')

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir +login $steam_username "+app_update 2350 validate" +quit

    # Move required files to pkgdir
    install -D -m 644 $srcdir/missionpack/pak0.pk3 $pkgdir/opt/quake3/missionpack/pak0.pk3
}

