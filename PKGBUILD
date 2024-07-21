# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Tim Besard <tim.besard@gmail.com>

pkgname=libqxt
pkgver=0.6.2
pkgrel=5
_pkgsuffix=dadc327c2a6a
pkgdesc='Provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit'
arch=('i686' 'x86_64')
url='http://www.libqxt.org'
license=('CPL-1.0 OR LGPL-2.1-only')
depends=('qt4' 'openssl' 'db')
makedepends=('avahi' 'libxrandr')
optdepends=('avahi: Zeroconf support')
options=('!emptydirs')
source=("http://bitbucket.org/${pkgname}/${pkgname}/get/v${pkgver}.tar.bz2"
	'libqxt-linking.patch'
	'libqxt-media-keys.patch'
	'libqxt-header-fix.patch'
	'libqxt-gcc6.patch')
sha512sums=('13bc6d33694b43b07a1f40c27641389e21c5b172d75ee2f5cca1b818dc6c89e5f7d458cc6085b00079ae0b6dc63bca20fb2522125d293845e24612124e8d2592'
            '6694fdea69fb0a84f4e8fc48c004f75599689624ca3a2b4cb60dd30115c8a2e3cd4e54a5a4e105050888d390610671f2e6087603135ccee9b899d1df24e982b9'
            '35c5374d86f5a16a2e1bf002a4e02e2f33aa819db0ec568a73822daf5174a23b6496d96977ca319b0c3d2f312f2e31d75cd6b9983a87c8cd1b20520d20d504a3'
            '01497cccc20ae7c39209cdb37260267e756d8e7bb276685019001f4288bff900b2aed0dcfefd5e2afdf411258bec078c4c0803a99eb218ceb230eed5f54ce958'
            '0f508074218c50aa004896038b6834b98a7a9a5f790b21db673d5c71536f7598be86fae0c0b674dc428fb102d987bedd752c6f5689b8062b9581cb92615f48c0')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_pkgsuffix}"
	patch -p1 -i '../libqxt-linking.patch'
	patch -p1 -i '../libqxt-media-keys.patch'
	patch -p1 -i '../libqxt-header-fix.patch'
	patch -p1 -i '../libqxt-gcc6.patch'
}

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_pkgsuffix}"
	./configure -qmake-bin '/usr/bin/qmake-qt4' \
	            -prefix '/usr' \
	            -libdir '/usr/lib' \
	            -docdir '/usr/share/doc'
	make
	#make docs
}

package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${_pkgsuffix}"
	make INSTALL_ROOT="${pkgdir}" install
}
