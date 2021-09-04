# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>
# Contributor: Sebastian Gsänger <sebastian_gsaenger [at] web.de>

pkgname=etqw-data-steam
pkgver=1
pkgrel=1
arch=('any')
makedepends=('steamcmd')
pkgdesc="Enemy Territory Quake Wars data via Steam"
license=('custom')
provides=('etqw-data')
url='https://steamdb.info/app/10000/'

prepare() {
    mkdir -p $srcdir/etqw

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/etqw +login $steam_username "+app_update 10000 validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/etqw/base/{megatextures,video}

    # Move required files to pkgdir
    cp $srcdir/etqw/base/pak00{0..4}.pk4 $pkgdir/opt/etqw/base/
    cp $srcdir/etqw/base/zpak*000.pk4 $pkgdir/opt/etqw/base/
    cp $srcdir/etqw/base/megatextures/* $pkgdir/opt/etqw/base/megatextures/
    cp $srcdir/etqw/base/video/* $pkgdir/opt/etqw/base/video/
}
