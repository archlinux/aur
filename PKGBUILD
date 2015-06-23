# Maintainer: Joe Davison <joedavison.davison@gmail.com>

pkgname=darkplaces-server
pkgver=20110628
pkgrel=1
pkgdesc="An advanced Quake 1 game engine, server only."
arch=('i686' 'x86_64')
url="http://icculus.org/twilight/darkplaces/"
license=('GPL2')
depends=()
makedepends=()
install=$pkgname.install
source=(http://icculus.org/twilight/darkplaces/files/darkplacesengine$pkgver.zip)
md5sums=('c42103732cedfcf385ee959db9db6cb4')
build() {
    # Extract the package
    cd $srcdir
    bsdtar -xf darkplacesenginesource$pkgver.zip || return 1

    # Compile
    cd darkplaces
    make OPTIM_RELEASE="${CFLAGS}" DP_FS_BASEDIR=/usr/share/quake sv-release || return 1

    # Install binary, icon and desktop files
    install -d $pkgdir/usr/{bin,share/quake}
    install -m 755 darkplaces-dedicated $pkgdir/usr/bin/

}
