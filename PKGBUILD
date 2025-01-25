#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=browservice
pkgver=0.9.11.0
pkgrel=1
pkgdesc='Browse the modern web on historical browsers - source build'
url='https://github.com/ttalvitie/browservice'
license=('MIT')
arch=('x86_64')
options=(!strip)
conflicts=('browservice-bin')
depends=('wget' 'cmake' 'poco' 'pango' 'libjpeg-turbo' 'libxcb' 'libx11' 'python' 'xorg-server-xvfb' 'xorg-xauth' 'at-spi2-atk' 'alsa-lib' 'nss' 'libcups' 'libxcursor' 'libxss' 'libxcomposite' 'libxkbcommon' 'ttf-ms-fonts' 'gtkglext' 'fuse2' 'fuse3')
source=("https://github.com/ttalvitie/browservice/archive/refs/tags/v$pkgver.zip"
	"https://github.com/ttalvitie/browservice/releases/download/v$pkgver/patched_cef_x86_64.tar.bz2"
       "setup_cef.sh")
noextract=('patched_cef_x86_64.tar.bz2')
sha256sums=('87104f6d560377c83fabf522ed8608b43189f9e1f9fc1204a311a142144f55c5'
	    'bd1d4803ea6061a2072edfe91b8b2948515533147cb06ad7bd6763b2211c7fdd'
	   'e21f43dbcb8e05c309843c949b8557a8c3d56818ffc96cfc51db36ac0f367610')

build() {
    cd $srcdir/browservice-$pkgver/
    cp ../setup_cef.sh .
    ./setup_cef.sh ../patched_cef_x86_64.tar.bz2
    make -j5 release
}
 
package() {

    cd ${srcdir}/browservice-$pkgver/release/bin/
    mkdir -p ${pkgdir}/usr/bin/browservicestuff/
    cp -r * ${pkgdir}/usr/bin/browservicestuff/
    cd ${pkgdir}/usr/bin/browservicestuff/
    chmod 755 *
    cd ..
    ln -s browservicestuff/browservice browservice
    echo "Be sure to run browservice --install-verdana for optimal GUI performance."
}
