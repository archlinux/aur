# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240715.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache-2.0')
optdepends=('docker: for Docker runtime support')
provides=(
	"${pkgname%-bin}"
)
conflicts=(
	"${pkgname%-bin}"
)
source_x86_64=(
	"$_pkgbin-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgbin"
	"$_pkgshim-x86_64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/x86_64/$_pkgshim"
)
source_aarch64=(
	"$_pkgbin-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgbin"
	"$_pkgshim-aarch64-$pkgver::https://storage.googleapis.com/${pkgname%-bin}/releases/release/$pkgver/aarch64/$_pkgshim"
)
sha512sums_x86_64=('9170a4cd1cd3451164bb6b5e013d78064960b9200442744034f7aef7b7653eca7251fc159202e4f355391943af77799fab213719663addd755c0696d5ceb6afb'
                   'da60cdc019b61cfecf8e2fefa12e1d2486adf7ba7d92947d04102f17accf72f393385fe47e33e26236308c0abc025579f7b5251110d9669ac02c3d05c81b98d7')
sha512sums_aarch64=('8424bc2fad7845453d1c1245c26df5986a704c53787fb12fd438f81b9b044e3d828ebbbc91806f55c81b5747b2f6dcf2eca0bbfd460ed6d5932a76c00222357d'
                    'aa040217f54f987a65c052eba3bddde24bc63542717eec7afb8ab4d8701dc828c039e39af95079cc2fee293a53ed597c248ba07232c6ddad43b5fd73fcf41731')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
