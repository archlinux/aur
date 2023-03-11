# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-bin
_pkgname="${pkgname%-bin}"
pkgver=0.5.0
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
sha256sums_x86_64=('defbc88a7a6d34f2ed724099b5be2c6c2a184eba8ba619880101d197e1a87609')
sha256sums_aarch64=('5bec99dc241ade94b7aa454de86f55da949b8801313d4c84767053ce4fe4c247')
sha256sums_riscv64=('d5197674d95d4a690fc7db47f6ab6a3a3163a75ddf923c0b268aa7875a2f17e6')

package() {

	if [ "${CARCH}" = "x86_64" ]; then
		install -Dm 755 "lib/lib${_pkgname}wayland.so" "${pkgdir}/usr/lib/lib${_pkgname}wayland.so"
	fi

	install -Dm 755 "lib/lib${_pkgname}x11.so" "${pkgdir}/usr/lib/lib${_pkgname}x11.so"
	install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"
}
