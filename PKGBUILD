# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>
# Contributor: Sebastian Gsänger <sebastian_gsaenger [at] web.de>

pkgname=doom3xp-data-steam
_pkgname=doom3
pkgver=1
pkgrel=1
_steamid=9070
arch=('any')
makedepends=('steamcmd')
pkgdesc="Doom 3 Expansion data via Steam"
license=('custom')
provides=('doom3xp-data')
url='https://store.steampowered.com/app/9070/DOOM_3_Resurrection_of_Evil/'

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}/d3xp

    # Move required files to pkgdir
    install -D -m 644 $srcdir/${_pkgname}/d3xp/*.pk4 $pkgdir/opt/${_pkgname}/d3xp/
}
