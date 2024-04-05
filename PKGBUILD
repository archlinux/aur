# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240401.0
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
sha512sums_x86_64=('c48737d39cf9f85cdfca9717237322eeba52a05e5aef8e6a843bbdbdabda998616f878eef2c4a4f26cb9348cabd02fc78389d12bdff614758cc385b6eded0448'
                   '6c653476af1d2cb5817323af05c224d1ba5d807006224bdc6f391e90087d896977106023a5a578ce8edc144d945b8abe3a05bb79ae25507d1fdd85c6b90d145e')
sha512sums_aarch64=('933735a562d02d2c332ec80222c11292317578e44d1135ec19e5757b2c64456f70adabfb688383e8ae3079da6b309ffe84be1cf1dd90268b776f879331e33f14'
                    'd313fe8cb1a14e6b92507e8e128270f8fadedb66efff47586765983236a50ce07a02d6dc40726fc8b7ccc037b46f2593f3a6824ade227a0e269bc71fa7eb0868')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
