# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=vmd-bin
pkgver=1.9.3
pkgrel=1
pkgdesc="VMD is a molecular visualization program for displaying, animating, and analyzing large biomolecular systems using 3-D graphics and built-in scripting"
arch=(x86_64)
url="https://www.ks.uiuc.edu/Research/vmd/"
license=(custom)
depends=()
makedepends=(make)
optdepends=()
provides=(vmd)
source=("local://vmd-${pkgver}.bin.LINUXAMD64-CUDA8-OptiX4-OSPRay111p1.opengl.tar.gz")
md5sums=('7f0cefa52e4ac3645018512fed70e474')

build() {
    cd "vmd-${pkgver}"
    export VMDINSTALLBINDIR="${pkgdir}/usr/bin"
    export VMDINSTALLLIBRARYDIR="${pkgdir}/opt/vmd-${pkgver}/lib"
    ./configure
}

package() {
    cd "vmd-${pkgver}/src"
    make install
    sed -i "/^set defaultvmddir/s|.*|set defaultvmddir=\"/opt/vmd-${pkgver}/lib\"|" ${pkgdir}/usr/bin/vmd
}
