# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=odiff-bin
pkgver=4.3.2
pkgrel=5
pkgdesc="Blazing fast SIMD-optimized image comparison CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/dmtrKovalenko/odiff"
license=('MIT')
depends=('glibc')

provides=('odiff')
conflicts=('odiff')
source=(
	"LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/dmtrKovalenko/odiff/v${pkgver}/LICENSE.txt"
)
sha256sums=('9608ab37156c8d14fbb2fab1381d023c1fce07e7850306bba3a227a85ec4fab4')
sha256sums_x86_64=('2c17e6bcf92a58e6668f19f17f4a27fa4b1d70840994f31bd837b55bb6b297d7')
sha256sums_aarch64=('d65f748c463a6aa78fa7bcdd31acd797eaed5160867e7769a3b291cfea42c9a0')
source_x86_64=("odiff-linux-x64::https://github.com/dmtrKovalenko/odiff/releases/download/v${pkgver}/odiff-linux-x64")
source_aarch64=("odiff-linux-arm64::https://github.com/dmtrKovalenko/odiff/releases/download/v${pkgver}/odiff-linux-arm64")
noextract=('odiff-linux-x64' 'odiff-linux-arm64')

latestver() {
	curl -fsSL "https://api.github.com/repos/dmtrKovalenko/odiff/releases/latest" \
		| jq -r '.tag_name // empty' | sed 's/^v//'
}

package() {
	case "${CARCH}" in
		x86_64) _binary="odiff-linux-x64" ;;
		aarch64) _binary="odiff-linux-arm64" ;;
	esac
	install -Dm755 "${srcdir}/${_binary}" "${pkgdir}/usr/bin/odiff"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
