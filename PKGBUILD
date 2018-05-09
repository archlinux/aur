# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

_pkgname=touchegg
pkgname=${_pkgname}-qt5
pkgver=1.1.1
pkgrel=3
pkgdesc='Multitouch gesture recognizer (built with qt5)'
arch=('i686' 'x86_64')
provides=('touchegg')
conflicts=('touchegg')
url='https://github.com/JoseExposito/touchegg'
license=(GPL)
depends=('qt5-x11extras' 'libxtst' 'geis')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/JoseExposito/${_pkgname}/archive/${pkgver}.tar.gz"
	'0001-qt5.patch'
	'0002-gcc-6.patch')
sha256sums=('daeca6063eeb9d3ee95803699665ce0b6f101bb3ce8421df2676744556c0b8c8'
            'e8561682a4b64fea5a5e923788ae14ec7f8ad5b0ea03d053da27479f8a435de3'
            '9532341ce46d7ff241ea62ea9ce26317f5133cb0fc5ed618e3b78e4015a54d13')

prepare() {
	cd "${_pkgname}-${pkgver}/${_pkgname}"

	# fix compilation against Qt 5.x
	patch -Np1 < "${srcdir}"/0001-qt5.patch

	# fix compilation with GCC 6.x
	patch -Np1 < "${srcdir}"/0002-gcc-6.patch
}

build() {
	cd "${_pkgname}-${pkgver}/${_pkgname}"

	qmake-qt5
	make
}

package() {
	cd "${_pkgname}-${pkgver}/${_pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
}
