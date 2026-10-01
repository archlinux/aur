# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lydakis
_gitname=errand
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Run it on another machine you own, get the result back — a personal job runner for your tailnet"

pkgver=0.7.0
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
sha256sums=('85702095eb10fb8645b767bf12a1cdcfcbdd243d52f3d5888fa1e0c9ecc4a04e'
            '45288ab9639b6d0c86b8c5295409c2a1ae2687bd567cd906978b63c90ca23cd6'
            'abe86a5d159afab1602de606c0c24f55c4e1922d70f2a11963bdcacc1001aa1f'
            '771195cf8e9cdf714a5c1bc632f04e47f075cf488bf3255435d812c0a4c331d1'
            'db53e73c13de3b1b9306b2943a748b2c8da7106cb75e95534f1a2e94c297865b'
            'f4625955f10d969e367879f213bab09023fe376fa614abe94bf2ab98d499b549'
            'd0907c2d9a47956f06044f2231d2e1e7e50826ce6cd77f24e423eebfafc89de9'
            '81fc7579f732157a6efc5390dd21e363ed9c037843b842fffe152abc2c1224ab'
            '0131aff723568efae680b8d95b327edd397fa47a3cd6fd53147bbd805009cb50')
sha256sums_x86_64=('c4b5c87eff12ac019f8e9fcb8aa77c5f6c6f49f45223b7e2e83ad0640af5bd0d')
sha256sums_aarch64=('c4a0a1242fb46fc001cd1a1c705654f3ca472fe615088824592a9d84e6d0d1f0')


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
