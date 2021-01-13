# Maintainer: Mirko Scholz
pkgname=qwt5-qt5
_commit=0052f96fdd6d5f021f20a1cfc4d2fcfc605941da
pkgver=5.2.3.2
pkgrel=1
pkgdesc='Qwt library (version 5.2.3) updated to work with Qt5.'
arch=('x86_64')
license=('custom')
depends=('qt5-base' 'qt5-svg')
url='https://github.com/gbm19/qwt5-qt5'
source=(
"qwt5-qt5-${pkgver}.zip::https://github.com/gbm19/qwt5-qt5/archive/${_commit}.zip"
"qwtconfig-archlinux.pri"
)
sha1sums=('528b8dd247aa314523e8c81314cdd0195fcf51fc'
          'f78e1dd11f7e5dedf0b62370485688729cb344ad')

prepare() {
	install -Dm644 "qwtconfig-archlinux.pri" "${srcdir}/qwt5-qt5-${_commit}/qwtconfig.pri"
}

build() {
	cd "${srcdir}/qwt5-qt5-${_commit}"
	qmake-qt5 qwt.pro
	make
}

package() {
	cd "${srcdir}/qwt5-qt5-${_commit}"
	make INSTALL_ROOT="${pkgdir}" install

	# remove docs
	rm -r "${pkgdir}/usr/share/doc/"
	rm -r "${pkgdir}/usr/share/man/"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
