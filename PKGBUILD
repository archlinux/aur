# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230501.0
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
sha512sums_x86_64=('a4f745195a5040d33a1b2583bb455fbb417e4ad08a117b88db630e2158ffb067cf6de83d2481d0126b39f73ba77a440373500075860ce33c44dc1bb396f873e0'
                   '036b102b62fd8e932b2e7da9919597d4b541ec62cd691d57241658ed156aa62743c1ab648903d317d74a22dbb5d2a922f8d067e86af2cb436ce5eb55c7cf4f93')
sha512sums_aarch64=('18bac7c31934d705b226ca2a897f32247dbaacd51652c3b7d6a07bbcb4b18be61ff6253abe873325ed974ae7c254c689eeedaf26fff400f21391778f06b36290'
                    'c051ce23a0dffbd520ae3f85da918cb120fd36cb33e6043a99f7f6ac942eea471b8d3b68a6688a9c7e23a0c6692565dcce2746aa0eca5cd5b486a14a6caa4824')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
