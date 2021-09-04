# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>
# Contributor: Sebastian Gsänger <sebastian_gsaenger [at] web.de>

pkgname=quake4-data-steam
pkgver=1
pkgrel=1
arch=('any')
makedepends=('steamcmd')
pkgdesc="Quake 4 data via Steam"
license=('custom')
provides=('quake4-data')
url='https://store.steampowered.com/app/2210/Quake_IV/'

prepare() {
    mkdir -p $srcdir/quake4

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/quake4 +login $steam_username "+app_update 2210 validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/quake4/q4base

    # Move required files to pkgdir
    cp $srcdir/quake4/q4base/pak0{01..12}.pk4 $pkgdir/opt/quake4/q4base/
    cp $srcdir/quake4/q4base/zpak*h.pk4 $pkgdir/opt/quake4/q4base/
}
