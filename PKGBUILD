# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=odiff-bin
pkgver=4.3.2
pkgrel=1
pkgdesc="Blazing fast SIMD-optimized image comparison CLI"
arch=('x86_64')
url="https://github.com/dmtrKovalenko/odiff"
license=('MIT')
depends=('glibc')
makedepends=('curl' 'jq')
provides=('odiff')
conflicts=('odiff')
source=(
	"LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/dmtrKovalenko/odiff/v${pkgver}/LICENSE.txt"
	"odiff-linux-x64::https://github.com/dmtrKovalenko/odiff/releases/download/v${pkgver}/odiff-linux-x64"
)
noextract=('odiff-linux-x64')
sha256sums=('9608ab37156c8d14fbb2fab1381d023c1fce07e7850306bba3a227a85ec4fab4'
            '2c17e6bcf92a58e6668f19f17f4a27fa4b1d70840994f31bd837b55bb6b297d7')

pkgver() {
	curl -s "https://api.github.com/repos/dmtrKovalenko/odiff/releases/latest" \
		| jq -r '.tag_name' | sed 's/^v//'
}

package() {
	install -Dm755 "${srcdir}/odiff-linux-x64" "${pkgdir}/usr/bin/odiff"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
