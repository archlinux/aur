# Contributor: zoe <chp321 [at] gmail (dot) com>
# Maintainer: zoe <chp321 [at] gmail (dot) com>

pkgname=tsmuxer
PkgName=tsMuxer
pkgver=2.6.13
pkgrel=2
pkgdesc="Remux/mux elementary streams, EVO/VOB/MPG, MKV/MKA, MP4/MOV, TS, M2TS to TS to M2TS, without re-encoding. Can quickly generate your own Blu-ray discs by processing your media files and converting them into streamable content. CLI and GUI all-in-one"
arch=('x86_64')
url="https://github.com/justdan96/${PkgName}"
license=("Apache License 2.0")
depends=('freetype2' 'zlib' 'qt5-multimedia' 'qt5-declarative')
makedepends=('ninja')
source=("${pkgname}.git::git+https://github.com/justdan96/${PkgName}.git"
        "${pkgname}.desktop")
md5sums=(SKIP 'f1419c462f5decb22bec6bae4077693c')

build() {
cd ${srcdir}/${pkgname}.git
rm -rf build
mkdir build
cd build
cmake ../ -G Ninja -DTSMUXER_GUI=ON
ninja
}

package() {
cd ${srcdir}/
install -D -m644 -t ${pkgdir}/usr/share/applications/ ${pkgname}.desktop
cd ${srcdir}/${pkgname}.git/
install -D -m644 ./${PkgName}GUI/images/icon.png     ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png
install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE
install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ README.md CHANGELOG.md
cd ${srcdir}/${pkgname}.git/build/
install -D -m755 -t ${pkgdir}/usr/bin/  ${PkgName}/${pkgname}   ${PkgName}GUI/${PkgName}GUI
}
