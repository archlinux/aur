# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>
# Contributor: Sebastian Gsänger <sebastian_gsaenger [at] web.de>

pkgname=prey-data-steam
pkgver=1
pkgrel=1
arch=('any')
makedepends=('steamcmd')
pkgdesc="Prey data via Steam"
optdepends=('prey: Linux game binaries for Prey')
license=('custom')
provides=('prey-data')
url='https://steamdb.info/app/3970/'

prepare() {
    mkdir -p $srcdir/prey

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/prey +login $steam_username "+app_update 3970 validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/prey/base

    # Move required files to pkgdir
    cp $srcdir/prey/base/pak0{00..04}.pk4 $pkgdir/opt/prey/base/
}
