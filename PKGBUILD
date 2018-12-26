# Maintainer: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>

pkgname=psdoom-ng
pkgver=2017.10.02.2.3.0.20181228.2
pkgrel=1
pkgdesc="A FPS and operating system process killer (when you kill an enemy, it kills a process) based on psDooM and Chocolate Doom."
arch=('any')
url="https://github.com/yeoldegrove/psdoom-ng1"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_net' 'freedoom1')
source=("https://github.com/yeoldegrove/psdoom-ng1/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('87ab954dcb82026e1d7dae6892be9001063b172176254767d50186a98358c0e2')

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
