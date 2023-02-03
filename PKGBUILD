# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.0
pkgrel=2
pkgdesc="Cut, copy, and paste anything in your terminal (binary version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-gcc12-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-gcc12-arm64.zip")
source_riscv64=("${_pkgname}-${pkgver}-riscv64.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-gcc12-riscv64.zip")
sha256sums_x86_64=('5fc53fe65848c7bf78b6b8f0e07ce34c0aeefe91edbf90f4c7f151e26f794f55')
sha256sums_aarch64=('d4d186913621a7c10bd05717a0086a0d02397c39136c5109d48d7aa1a0632d66')
sha256sums_riscv64=('f0c33d052ac21683cfe60da2ae06c4dabd0ae4a61921f22e70e83f15850ca9de')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/lib${_pkgname}wayland.so" "${pkgdir}/usr/lib/lib${_pkgname}wayland.so"
	fi

	install -Dm 755 "lib/lib${_pkgname}x11.so" "${pkgdir}/usr/lib/lib${_pkgname}x11.so"
	install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"
}
