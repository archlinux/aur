# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=touchegg-qt5
pkgver=1.1.1
pkgrel=1
pkgdesc='Multitouch gesture recognizer (built with qt5)'
arch=('i686' 'x86_64')
provides=('touchegg')
conflicts=('touchegg')
url='https://code.google.com/p/touchegg/'
license=(GPL)
depends=('qt5-x11extras' 'libxtst' 'geis')
source=("http://${pkgname%-qt5}.googlecode.com/files/${pkgname%-qt5}-${pkgver}.tar.gz"
	'qt5.patch')
sha256sums=('95734815c7219d9a71282f3144b3526f2542b4fa270a8e69d644722d024b4038'
	'e8561682a4b64fea5a5e923788ae14ec7f8ad5b0ea03d053da27479f8a435de3')

prepare() {
	cd "${pkgname%-qt5}-${pkgver}"

	patch -Np1 < "${srcdir}"/qt5.patch
}

build() {
	cd "${pkgname%-qt5}-${pkgver}"

	# Cannot build with default compiler/linker flags
	#unset CXXFLAGS CFLAGS LDFLAGS

	qmake-qt5
	make
}

package() {
	cd "${pkgname%-qt5}-${pkgver}"

	make INSTALL_ROOT="${pkgdir}" install
}
