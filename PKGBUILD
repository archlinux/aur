# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>

pkgname=psdoom-ng
pkgver=2017.10.02.2.3.0.20181229
pkgrel=1
pkgdesc="A FPS and operating system process killer (when you kill an enemy, it kills a process) based on psDooM and Chocolate Doom."
arch=('any')
url="https://github.com/yeoldegrove/psdoom-ng1"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'freedoom1')
source=("https://github.com/yeoldegrove/psdoom-ng1/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d4ec606714daa568e84b59b94b361845e5e7681ae33c5ae4f1d2b543da1653e1')

build() {
    cd "psdoom-ng1-${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix /usr && make
}

package() {
    cd "psdoom-ng1-${pkgname}-${pkgver}"
    # install custom psdoom levels to /usr/share/games/doom
    mkdir -p ${pkgdir}/usr/share/games/doom
    tar xf contrib/psdoom-2000.05.03-data.tar.gz -C ${pkgdir}/usr/share/games/doom
    mv ${pkgdir}/usr/share/games/doom/psdoom-data/*.wad ${pkgdir}/usr/share/games/doom
    rm -rf ${pkgdir}/usr/share/games/doom/psdoom-data/
    # install everything else
    DESTDIR=${pkgdir} make install
}
