# Maintainer: Michael Massoni <hello@michaelmassoni.com>
pkgname=yap-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple, human-readable wrapper for yay"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/michaelmassoni/yap"
license=('GPL3')
depends=('yay')
conflicts=("yap")

_url="https://github.com/michaelmassoni/yap/releases/download/v${pkgver}"
source_x86_64=("yap_x86_64-${pkgver}::${_url}/yap_x86_64")
sha256sums_x86_64=('41ce2f22ccdacc5f3dce9261fc09d8e2bffdf15709da350c035a7eb352b898e8')

source_aarch64=("yap_aarch64-${pkgver}::${_url}/yap_aarch64")
sha256sums_aarch64=('78cc5deb7c207effc8b92bbd65895dbfba29d36f800062bb3b93f0ff891b30e5')

source_armv7h=("yap_armv7h-${pkgver}::${_url}/yap_armv7h")
sha256sums_armv7h=('90c6ed0b5d3cdc6bbe816980f3765ecd4d4feb44ce0abacbc22e41807ff0012e')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/michaelmassoni/yap/v${pkgver}/LICENSE")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
	local _bin="${srcdir}/yap_${CARCH}-${pkgver}"
	install -Dm755 "${_bin}" "${pkgdir}/usr/bin/yap"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Shell completions are embedded in the binary
	local _yap="${pkgdir}/usr/bin/yap"
	install -dm755 "${pkgdir}/usr/share/bash-completion/completions" \
		"${pkgdir}/usr/share/zsh/site-functions" \
		"${pkgdir}/usr/share/fish/vendor_completions.d"
	"${_yap}" completion bash > "${pkgdir}/usr/share/bash-completion/completions/yap"
	"${_yap}" completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_yap"
	"${_yap}" completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/yap.fish"
}
