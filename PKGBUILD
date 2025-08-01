# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="papertoy"
_repo="sin-ack/$_pkgname"
pkgname="${_pkgname}-bin"
pkgver=0.1.1
pkgrel=1
pkgdesc="Run a Shadertoy-compatible shader as an animated wallpaper on Wayland"
arch=('x86_64')
url="https://github.com/$_repo"
license=('GPL-3.0-only')
depends=("wayland" "libglvnd")
makedepends=("curl")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('a99cf9f5a36250e204eacf564fe697bed90b4b4e413ddc896cba1aa3e9a9d287')
source=("https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v$pkgver/$_pkgname-linux-x86_64")
pkgver() {
	curl --silent -L "https://api.github.com/repos/${_repo}/releases/latest" | # Get latest release from GitHub api
		grep '"tag_name":' |                                                      # Get tag line
		sed -E 's/.*"([^"]+)".*/\1/' |
		sed 's/v//'
}

package() {
	install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 755 "${srcdir}/$_pkgname-linux-x86_64" "${pkgdir}/usr/bin/$_pkgname"
}
