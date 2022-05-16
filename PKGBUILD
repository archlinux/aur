# Maintainer: Mirko Scholz
pkgname=qwt5-qt5
_commit=a2b11e3f7c83dcba30a9bfac86a54ccb8305691d
pkgver=5.2.3.4
pkgrel=3
pkgdesc='Qwt library (version 5.2.3) updated to work with Qt5.'
arch=('x86_64')
license=('custom')
depends=('qt5-base' 'qt5-svg')
options=(staticlibs !strip)
url='https://github.com/gbm19/qwt5-qt5'
source=(
"qwt5-qt5-${pkgver}.zip::https://github.com/gbm19/qwt5-qt5/archive/${_commit}.zip"
"qwtconfig-archlinux.pri"
)
sha1sums=('5550f97767e4424188de7260b295b1b32b303288'
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
