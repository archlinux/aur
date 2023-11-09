# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20231106.0
pkgrel=1
pkgdesc='OCI container sandbox runtime focused on security, efficiency, and ease of use'
arch=('x86_64' 'aarch64')
url='https://gvisor.dev'
license=('Apache')
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
sha512sums_x86_64=('ff9a8e04add827496936b6f8d7d673ed88a29c27b21c50a8232674b7a86a2e426a42f71fd6c27425e1401d60a7afa0e684c8ac92d990f367b5991f84bce85d25'
                   'f304dbff8992645adcf0f598cbf58117b18f23bdcba9b7f121c2d0d53e45160007759e1f89d35a5639053166a001ea9c6400a084949b720d72d342dbff437c95')
sha512sums_aarch64=('1d84f118c9e7ff53071cea3b883bf82b5af63dff67f539358443747681f668f9ea2808e720b297dc137574a503bfd8e27227077a98a396bcb0007497cac5bec8'
                    '0073d46f92a2b66ba9b9a79313a9e370d534ee9614d02181395741ae5f793600540e765913599866ecce0252f411d6b77429ccd2e39a1d4fd289801fccf0978b')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
