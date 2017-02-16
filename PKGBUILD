
# Maintainer: LighDot <lightdot -a-t- g m a i l>
pkgname=lgeneral
pkgver=1.3.1
pkgrel=1
pkgdesc="A turn-based strategy engine heavily inspired by Panzer General (pg-data and kukgen-data included)"
arch=('i686' 'x86_64')
url="http://lgames.sourceforge.net/LGeneral/"
license=('GPL2' 'custom' 'CCPL') # pg-data is abandonware, hence custom
depends=('sdl_mixer' 'hicolor-icon-theme')
install="${pkgname}.install"
provides=('lgeneral-data')
conflicts=('lgeneral' 'lgeneral-data')
source=(
 "http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
 "http://downloads.sourceforge.net/${pkgname}/pg-data.tar.gz"
 "http://downloads.sourceforge.net/${pkgname}/kukgen-data-1.1.tar.gz")
md5sums=(
 '7605ccf7eac6ce7a8c36b6db0613ceb6'
 '40c4be23f60d1dc732aabe13b58fc5e3'
 '5a9755bdb2ae0a94910c093c5feafd61')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    mkdir ${pkgdir}/usr/share/lgeneral-data
    mkdir ${pkgdir}/usr/share/licenses
    mkdir ${pkgdir}/usr/share/licenses/lgeneral
    cp -pR ../pg-data ${pkgdir}/usr/share/lgeneral-data/pg-data
    cp ../pg-data/README ${pkgdir}/usr/share/licenses/lgeneral/README.pg-data
    cp -pR ../lgeneral-data-1.1-d4d831b06c39a4d20dd0a96d0a89e3d50f22e69a ${pkgdir}/usr/share/lgeneral-data/kukgen-data-1.1
}
