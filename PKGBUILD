# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.0
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
sha256sums_x86_64=('aa070c5f2e6444ecfe5f6a3631bce740e11fe22cef01179508a5acacd473fe32')
sha256sums_aarch64=('eee84825f52aac0332f4b05dc9dc66930011312e7770cb1615591a8b6a31b6d0')
sha256sums_riscv64=('6bec831fc38c6d9867fb969f2c7004512b3ccdcbcffaebb881fc4b112e801973')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/lib${_pkgname}wayland.so" "${pkgdir}/usr/lib/lib${_pkgname}wayland.so"
	fi

	install -Dm 755 "lib/lib${_pkgname}x11.so" "${pkgdir}/usr/lib/lib${_pkgname}x11.so"
	install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"
}
