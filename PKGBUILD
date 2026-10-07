# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=lydakis
_gitname=errand
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Run it on another machine you own, get the result back — a personal job runner for your tailnet"

pkgver=0.8.1
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
sha256sums=('36ea605fa9a9140d536820d6544399a7297759fbada3f9bd423d946c97c5eee6'
            '67ad6ee2e72901b1545f24b3b152ccd1e35e27c49b7706e3c388805f86f14402'
            'abe86a5d159afab1602de606c0c24f55c4e1922d70f2a11963bdcacc1001aa1f'
            'baf396f7e9524b0fb2234dab972d71e45f6ed5d0bc1538f8e09858e4f8788379'
            'efd86b0964348767a30fdd4bdffac2d634dda25a0a7e8768fa0ebe96c7230222'
            'f4625955f10d969e367879f213bab09023fe376fa614abe94bf2ab98d499b549'
            '92d725d06966d72c0d8d3842d47921aee5b117b0f084cbbea5693fc5ecb23349'
            '81fc7579f732157a6efc5390dd21e363ed9c037843b842fffe152abc2c1224ab'
            'd3d1dc7f3dc0cac73db8c8ed0873399a57c89d3f323f07145d26a25011d0917d')
sha256sums_x86_64=('98a63bf6bed8da4991f00a7657cf07da01e068eb25eb5398a14171e1605b223f')
sha256sums_aarch64=('25abb8b45eba6ad8508a85b4aeb289bd090bba6bbd770fff59e95549e7fa3fb0')


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
