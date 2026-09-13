# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lydakis
_gitname=errand
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Run it on another machine you own, get the result back — a personal job runner for your tailnet"

pkgver=0.4.4
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
sha256sums=('5bd60ae1dd479d6534eea9ca97de03f0eb87c8dafe63d0b8f1f6945b626a9551'
            'eeb11d85d048ba84dcd975a21798529b51ce02e5a93433aeb5d68a67094e2079'
            '8b2027f2041ea2524630441151ce4d86b167d5884d0352e308b1504fca2060a2'
            '975fabff9448c38625abb175c04e838c141400d70d9b1b15e60068b5d22fd43c'
            '94593865e07f0c30a002cd99de8bad08e02bb8ccec7446e6ce03b71fd7ddc37c'
            '3c74d127c37f90e107ba8fd9d7e3a22aed3d311184a8cbe33e6673fd5be005dc'
            'd0907c2d9a47956f06044f2231d2e1e7e50826ce6cd77f24e423eebfafc89de9'
            '81fc7579f732157a6efc5390dd21e363ed9c037843b842fffe152abc2c1224ab'
            '0131aff723568efae680b8d95b327edd397fa47a3cd6fd53147bbd805009cb50')
sha256sums_x86_64=('cbe1f6909a815e0a63940c522e841c14de358e98612128bb2a26a2a91dd99d92')
sha256sums_aarch64=('31625dd3398f1a8eced644d6c586e49c00d32dc51f1f25aca508a718f4e0349a')


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
