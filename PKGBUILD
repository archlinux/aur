# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>
# Contributor: Sebastian Gsänger <sebastian_gsaenger [at] web.de>

pkgname=rtcw-data-steam
_pkgname=return_to_castle_wolfenstein
pkgver=1
pkgrel=1
arch=('any')
makedepends=('steamcmd')
pkgdesc="Return to Castle Wolfenstein data via Steam"
license=('custom')
provides=('rtcw-data')
conflicts=('rtcw-data-gog')
url='https://store.steampowered.com/app/9010/Return_to_Castle_Wolfenstein/'

prepare() {
    mkdir -p $srcdir/rtcw

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/rtcw +login $steam_username "+app_update 9010 validate" +quit
}

package() {
    # Move required files to pkgdir
    install -Dm644 "${srcdir}/rtcw/Main/sp_pak3.pk3" "${pkgdir}/opt/${_pkgname}/main/en_pak3.pk3"
    install -Dm644 "${srcdir}/rtcw/Main/"*.pk3 "${pkgdir}/opt/${_pkgname}/main/"
    install -Dm644 "${srcdir}/rtcw/Main/scripts/translation.cfg" "${pkgdir}/opt/${_pkgname}/main/scripts/translation.cfg"
}
