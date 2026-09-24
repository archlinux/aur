# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=flawme
_gitname=varn
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Local state checkpointing and rollback system for AI agents and automated tools"

pkgver=0.4.0
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
sha256sums=('4355d822444416e12c1f16b106f8c0f5636a404424c5ccf37eba2dd6180a34fe'
            'f83bf7229951c62779214ce8524594505c86807accde359cb0fcf209a8270c40'
            'bb5a8267a3f845a21e8ba4199ca3070423a95234a805849b30071e09dd482126'
            'abd1036686f00026fee10c28a3fb74870f32c111fd94e3a4c625bfdfd5aea68b'
            'e8fcecf9edb279be59241dee97fc88faa4a9c922a428dad3300b2b2901e97cdc'
            '5a61d78a5c8936ecf77be956d24980463397756f0cc29fb5d0776fa914f66396')
sha256sums_x86_64=('67e0cfb1930daedef1c62445cf4c708855bd1b740f3d1431b1cfbd7720fa058a')


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
