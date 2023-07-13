# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20230710.0
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
sha512sums_x86_64=('40fe7f27de606c2ee35cf93e165b21502cf4c01610601a8b320a923785457ddd2353e5d519a7907ba7ef1b42577fce1c38d5c7d104e7a18f165cdf4d2124c030'
                   '61723a7a40ac826fd688a564e5a15843415032b29ec1582f526b08abcfb8c8f260f0106f09a6c8886cf16349268a1157e8a55ec27cf0d4db0945c5e9fe535eb4')
sha512sums_aarch64=('b7a4962f8cb267a45b623ec2a5fcd2da33f5849e9e036a34b1cb95e7fd559a0706d964c9d9aa07235d20abc2fe981ea244adcd05a3ff76263fcabb4d06690a94'
                    'd50c7c661a5ff7de8ed0b5533f979f26946590dcf2b207e99846015358242aca61e2ea800f730c93940c109fdb4cf709fe428a9a8bf90218dc53d3a5b2dc5871')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
