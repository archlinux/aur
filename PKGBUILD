# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.3.1
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
source_x86_64=("${_pkgname}-${pkgver}-amd64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-gcc12-amd64.zip")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-gcc12-arm64.zip")
source_riscv64=("${_pkgname}-${pkgver}-riscv64.zip::https://github.com/Slackadays/Clipboard/releases/download/${pkgver}/${_pkgname}-linux-gcc12-riscv64.zip")
sha256sums_x86_64=('fc86a8c34fa7160e0fd4002212d36bbbd3fcbf62a7cabb44ca24c2cebfa26bde')
sha256sums_aarch64=('c2001492a47dedc5d241e467a43c6f27493db789f7c66c019343ebaa134627fe')
sha256sums_riscv64=('27b86049ced8562a0eee5cd1d75b2fd2fb25ef336fe7d90554d24ced7243a8ad')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/lib${_pkgname}wayland.so" "${pkgdir}/usr/lib/lib${_pkgname}wayland.so"
	fi

	install -Dm 755 "lib/lib${_pkgname}x11.so" "${pkgdir}/usr/lib/lib${_pkgname}x11.so"
	install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"
}
