# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
_pkgname=pdf4qt
pkgname="${_pkgname}-bin"
pkgver=1.3.5
pkgrel=1
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

source=("https://github.com/JakubMelka/${_pkgname^^}/releases/download/v${pkgver}/${_pkgname^^}-${pkgver}.deb")
b2sums=(994bc536362feafa42b11f924a4ad565f62ff59fd15f03560812a45a188ff70f205b95ea993931461810935aa784b85498d339bf8fa4e5f002b494293aa6027d)

prepare() {
	cd "${srcdir}"
	tar xvf data.tar.zst
}

package() {
	echo "package"
	install -D --mode=755 ./usr/share/applications/* --target-directory="${pkgdir}/usr/share/applications"
	install -D --mode=755 ./usr/share/icons/* --target-directory="${pkgdir}/usr/share/icons"
	install -D --mode=755 ./bin/* --target-directory="${pkgdir}/usr/bin"
	install -D --mode=755 ./lib/*.so* --target-directory="${pkgdir}/usr/lib"
	install -D --mode=755 ./lib/pdf4qt/*.so* --target-directory="${pkgdir}/usr/lib/pdf4qt"
}

