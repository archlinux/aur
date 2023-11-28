# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
_pkgname=pdf4qt
pkgname="${_pkgname}-bin"
pkgver=1.3.6
pkgrel=2
pkgdesc="Open source PDF editor"
arch=('x86_64')
url="https://jakubmelka.github.io/"
license=('LGPL3')
depends=('openssl'
	'libjpeg-turbo'
	'qt6-speech'
	'qt6-svg'
	'qt6-base'
	'openjpeg2'
	'onetbb'
	'lcms2'
	'freetype2'
	'zlib'
	'glibc'
	'gcc-libs'
)
makedepends=()
optdepends=(
	'flite: Text-To-Speech using flite synthesizer',
	'libspeechd: Text-To-Speech using speechd synthesizer'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-bin")

source=("https://github.com/JakubMelka/${_pkgname^^}/releases/download/v${pkgver}/${_pkgname^^}-${pkgver}_Ubuntu_23_10.deb")
b2sums=('a16bd61b177df1c2fb39783fcdccb1937008c71a2dd0c0eba8fac2f5d66fbb5486891deca3d73496b8f32057a343a4d6fd005f304a9d60ba1caaa2873b249609')

prepare() {
	cd "${srcdir}"
	tar xvf data.tar.zst
}

package() {
	echo "package"
	install -D --mode=755 ./usr/share/applications/* --target-directory="${pkgdir}/usr/share/applications"
	install -D --mode=755 ./usr/share/icons/hicolor/128x128/apps/* --target-directory="${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	install -D --mode=755 ./usr/share/icons/hicolor/scalable/apps/* --target-directory="${pkgdir}/usr/share/icons/hicolor/scalable/apps"
	install -D --mode=755 ./usr/bin/* --target-directory="${pkgdir}/usr/bin"
	install -D --mode=755 ./usr/lib/*.so* --target-directory="${pkgdir}/usr/lib"
	install -D --mode=755 ./usr/lib/pdf4qt/*.so* --target-directory="${pkgdir}/usr/lib/pdf4qt"
}
