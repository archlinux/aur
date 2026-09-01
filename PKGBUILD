# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=flawme
_gitname=varn
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Local state checkpointing and rollback system for AI agents and automated tools"

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT' 'Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"ARCHITECTURE-${pkgver}.md::${_ghurlraw}/docs/architecture.md"
		"SAFETY-${pkgver}.md::${_ghurlraw}/docs/safety.md"
		"USAGE-${pkgver}.md::${_ghurlraw}/docs/usage.md"
		"LICENSE-MIT-${pkgver}::${_ghurlraw}/LICENSE-MIT"
		"LICENSE-APACHE-${pkgver}::${_ghurlraw}/LICENSE-APACHE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
sha256sums=('4010cc530f17f8bd0ae82041b16335ddef4be5ba3b35e36afa326486feebc9d3'
            'c5d4c55d6a6be114ce4df83b37cee64ef47bc5d11dcbaf0daae447664cd2c5e6'
            '39d7ae0b8fe8e89091e0cbdf42fb07b714053337936bf49ae29ed2a029b4b2b5'
            'd2baf7699363b96290b7097c3d7f580f28f4da940d2bbc878947827726fde693'
            'e8fcecf9edb279be59241dee97fc88faa4a9c922a428dad3300b2b2901e97cdc'
            '5a61d78a5c8936ecf77be956d24980463397756f0cc29fb5d0776fa914f66396')
sha256sums_x86_64=('f09e13ca1418a4ebfc3d0961cd7deb6c1374d94efff8cf58f11b5e2b67edf6d3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "SAFETY-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SAFETY.md"
	install -Dm644 "ARCHITECTURE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"

	install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE--APACHE"
}
