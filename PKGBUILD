# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.6.0
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://getclipboard.app"
license=('GPL3')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-arm64.zip")
source_riscv64=("${_pkgname}-${pkgver}-riscv64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-riscv64.zip")
sha256sums_x86_64=('619400c0d97ca76d9a29489d52ad0cf47cd98d879bcc0d5e2a6cf197d25442d0')
sha256sums_aarch64=('c902b8eb26e44d3946bd06f8d46cea9914b0d42c39c7f10753f1bb7ac6b9a595')
sha256sums_riscv64=('054a8f727e36aadc933dbe4ee227cbfb9d94f57dd4bba4c3af3d0f14a933f0ed')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/lib${_pkgname}wayland.so" "${pkgdir}/usr/lib/lib${_pkgname}wayland.so"
	fi

	install -Dm 755 "lib/lib${_pkgname}x11.so" "${pkgdir}/usr/lib/lib${_pkgname}x11.so"
	install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"
}
