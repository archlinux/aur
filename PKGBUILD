# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lydakis
_gitname=errand
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Run it on another machine you own, get the result back — a personal job runner for your tailnet"

pkgver=0.5.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source=("USAGE-${pkgver}.md::${_ghurlraw}/docs/USAGE.md"
		"DESIGN-${pkgver}.md::${_ghurlraw}/docs/DESIGN.md"
		"RELEASING-${pkgver}.md::${_ghurlraw}/docs/RELEASING.md"
		"OPERATIONS-${pkgver}.md::${_ghurlraw}/docs/OPERATIONS.md"
		"PERFORMANCE-${pkgver}.md::${_ghurlraw}/docs/PERFORMANCE.md"
		"NAMED_CACHES-${pkgver}.md::${_ghurlraw}/docs/NAMED_CACHES.md"
		"CONFIGURATION-${pkgver}.md::${_ghurlraw}/docs/CONFIGURATION.md"
		"CACHE_VALIDATION-${pkgver}.md::${_ghurlraw}/docs/CACHE_VALIDATION.md"
		"SERVICE_UPGRADES-${pkgver}.md::${_ghurlraw}/docs/SERVICE_UPGRADES.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('16bb7d5b14c5e216a0602b25bb0b9bb3e1bddf6ad7f1702ddac024e6b727566e'
            '45288ab9639b6d0c86b8c5295409c2a1ae2687bd567cd906978b63c90ca23cd6'
            '8b2027f2041ea2524630441151ce4d86b167d5884d0352e308b1504fca2060a2'
            '975fabff9448c38625abb175c04e838c141400d70d9b1b15e60068b5d22fd43c'
            'db53e73c13de3b1b9306b2943a748b2c8da7106cb75e95534f1a2e94c297865b'
            '3c74d127c37f90e107ba8fd9d7e3a22aed3d311184a8cbe33e6673fd5be005dc'
            'd0907c2d9a47956f06044f2231d2e1e7e50826ce6cd77f24e423eebfafc89de9'
            '81fc7579f732157a6efc5390dd21e363ed9c037843b842fffe152abc2c1224ab'
            '0131aff723568efae680b8d95b327edd397fa47a3cd6fd53147bbd805009cb50')
sha256sums_x86_64=('4a0178aa02221f4b26628391f318801a0d996c90e6ec1243e160ada8681d0635')
sha256sums_aarch64=('bb9be8e1f6b56aac8e6c04b1ed4ce78a46db524a2b2dafe967e4956cf390e856')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/DESIGN.md"
	install -Dm644 "RELEASING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASING.md"
	install -Dm644 "OPERATIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/OPERATIONS.md"
	install -Dm644 "PERFORMANCE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/PERFORMANCE.md"
	install -Dm644 "NAMED_CACHES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/NAMED_CACHES.md"
	install -Dm644 "CONFIGURATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIGURATION.md"
	install -Dm644 "SERVICE_UPGRADES-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/SERVICE_UPGRADES.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
