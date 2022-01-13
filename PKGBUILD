# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser-bin'
_pkgname="${pkgname%-bin}"
pkgver=v1.3.0
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
sha256sums_x86_64=('156b9d6c334c7732cacec79c3be77e1e76c3c6f510fbf581b63b1c691f1f38b9')

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=('8aa1a88ffd76d2b9fdc5f84865600cd4960e00b07122d7fc22dd55a755ef9b31')

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('c4b7cc1d27c96888d3155bcd0ebbcd49d1f30a7f8c0ac6870b9840f588fa1316')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# License
	install -Dm644 "./LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# Completions
  	mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  	mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"

	install -Dm644 "./completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 "./completions/${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
	install -Dm644 "./completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}