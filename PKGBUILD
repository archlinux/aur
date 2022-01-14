# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='goreleaser-bin'
_pkgname="${pkgname%-bin}"
pkgver=v1.3.1
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
sha256sums_x86_64=('845ac8e7ede20c508c4e42acbda38df094ff2b744cd17201ac65a0316daa8cfb')

source_i686=("${_pkgname}_${pkgver}_linux_i386.tar.gz::${_basedownloadurl}/${_pkgname}_linux_i386.tar.gz")
sha256sums_i686=('33124980054aaca6c555b94d9b0e55cb73771d8eb52adcac2b703c50fedc8b28')

source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::${_basedownloadurl}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_aarch64=('b0e65ea482c490e8a8c445b395e591f014dfcfeaec37a9b177d5f7864ecdf234')

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