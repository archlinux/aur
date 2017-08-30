# Maintainer: Ysblokje <ysblokje at gmail dot com>
# based on doom3-data-steam by Alan Jenkins <alan.james.jenkins [at] gmail.com>
pkgname=doom3bfg-data-steam
pkgver=1
pkgrel=1
pkgdesc="Doom 3 BFG data via Steam"
arch=('any')
provides=('doom3bfg-data')
#didn't work for me, just download the recent version from valve.
#depends=('steamcmd')
#steam eula??
license=('custom')
url='http://store.steampowered.com/app/208200'
source=("http://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz")
md5sums=(SKIP)
basedest='/usr/share/games/doom3bfg/'
PKGEXT='.pkg.tar'


build() {
    cd $srcdir
    doom3dir=$srcdir/doom3bfg
    mkdir -p $doom3dir

    # Use steamcmd to get doom3bfg.
    printf "Enter your Steam username:"
    read steam_username
    ./steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir $doom3dir +login $steam_username +app_update 208200 validate +quit
    find -L $doom3dir -type d -exec chmod 755 {} +
    find -L $doom3dir -type f -exec chmod 644 {} +
}

package() {
    cd $srcdir
    # Move required files to pkgdir
    mkdir -p $pkgdir/$basedest
    cp -a $srcdir/doom3bfg/base $pkgdir/$basedest/
}

