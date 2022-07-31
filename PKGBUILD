# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Brandon Hall <brandonjhall@windstream.net>
pkgname=aurbrowser
pkgver=1.3.0
pkgrel=5
pkgdesc="A Qt application that allows an Arch Linux user to browse and install packages from the AUR."
arch=('x86_64')
url="https://gitlab.com/brandonjhall/aurbrowser"
license=('GPL')
depends=('qt5-base>=5.10.0-1' 'gcc-libs>=7.2.1+20180116-1' 'glibc>=2.26-11' 'sudo')
source=(${pkgname}-${pkgver}.tar.gz::"https://gitlab.com/brandonjhall/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz" appname.patch)
install=aurbrowser.install
sha256sums=('2256a78017f766d61ad36911b095f492c03dc2f1dd0b912c6ac9e15eeb0ac81a'
            'ae7a058c2a79b0d0ed8cb1b77447a0f1daab84f050349d503619254b09984302')

prepare() {
	cd "${pkgname}-v${pkgver}"
	patch -p0 < ${startdir}/appname.patch
	sed -i 's/Path=\/usr\/local\/bin/Path=\/usr\/bin/g' AUR-Browser.desktop
	qmake "INSTALL_PREFIX=${pkgdir}/usr"
}

build() {
	cd "${pkgname}-v${pkgver}"
	make
}

check() {
	cd "${pkgname}-v${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-v${pkgver}"
	make DESTDIR="${pkgdir}/usr/bin" install
}
