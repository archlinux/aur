# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=xevdevserver
pkgver=2.1.0
pkgrel=1
pkgdesc="Captures keyboard/mouse events, sends them to given X display. Useful for multiseat."
url="http://research.edm.uhasselt.be/~jori/page/index.php?n=Misc.XevdevServer"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libstdc++5' 'errut' 'libx11' 'libxtst' 'libxext' 'ncurses' 'libxau' 'libxdmcp' 'glibc')
makedepends=('cmake')
source=("http://research.edm.uhasselt.be/~jori/page/uploads/Misc/$pkgname-$pkgver.tar.gz")
md5sums=('855c238b87c17ed1406065ef6d51e91d')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	# We do not need libtinfo
	msg "Patching sources..."
	sed -i 's#-ltinfo##g' CMakeLists.txt
	
	mkdir build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		..
	
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	
	install -D -m755 xevdevserver ${pkgdir}/usr/bin/xevdevserver
	install -D -m755 xevdevserver ${pkgdir}/usr/bin/xevdevkeyinfo
}
