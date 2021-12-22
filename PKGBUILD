# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser-bin'
_pkgname="${pkgname%-bin}"
pkgver=v1.2.1
pkgrel=1
pkgdesc='Deliver Go binaries as fast and easily as possible'
url='https://goreleaser.com'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

depends=()
makedepends=()
optdepends=('nfpm: deb and rpm packager'
	'snapcraft: snap packager')

_basedownloadurl="https://github.com/${_pkgname}/${_pkgname}/releases/download/${pkgver}"

source_x86_64=("${_pkgname}_${pkgver}_linux_x86_64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_x86_64.tar.gz")
sha256sums_x86_64=('02962c2683b2b0490dbdbb44d415458bf1bbbd9c82eec6bc845f95f3c56634a2')

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=('2e0b8bc67f92ac32384e03c3dd303d0b199a76ea5583ad8cf6d385c433b95c34')

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('f53ac7ac4eb4d00b6e35d983b203008bac55c90ec4308ff2c23e1feb5c2be88e')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# Completions
	install -Dm644 "${srcdir}/completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "${srcdir}/completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
