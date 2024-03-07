# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname='gvisor-bin'
_pkgbin='runsc'
_pkgshim='containerd-shim-runsc-v1'
pkgver=20240305.0
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
sha512sums_x86_64=('6fe6f09ea45c9d73592c823834632debbb4cb1fae64b23e7feb0dba37e925cb6b39d4c98a804b20d10c9f5c4bb9c2dd2055a1460999f450bee32aa49894b8a95'
                   'ae2e6efc9a510135c6478153efc58e865d4376e9147bde7ddcf5fa7a9ad221f479af1c3ea17f34c96f380d6f669e6de7277b9ed48efdcd0ea5c46e4d7a338761')
sha512sums_aarch64=('fc14d1996b84fa757518407183e1fe50bb1ac60c678521c10e1ebb2489211addc24722317746a24fa5f2838e49adfb118b9d966c4ff5713e08931f293a736ccb'
                    '587682b89914401b65d40e1a5dd1969c7a526c1b34feff6ef042c96659eec2a74a4d32c12fedf176a6751c4941cc1b9bd8584230bc719e7e5babfdb8957ddcd2')

package() {
	install -Dm 755 "$_pkgbin-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgbin"
	install -Dm 755 "$_pkgshim-$CARCH-$pkgver" "$pkgdir/usr/bin/$_pkgshim"
}
