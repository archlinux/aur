# Maintainer: fengkx <liangkx8237@gmail.com>
pkgname=clash-subscription-updater-git
_pkgname_raw=clash-subscription-updater
pkgver=r3.e2083ea
pkgrel=1
pkgdesc="Update the clash config.yaml peroidly with optional patch "
arch=(any)
url="https://github.com/fengkx/clash-subscription-updater"
license=('LGPL-3.0')
groups=()
depends=()
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
	'git+https://github.com/fengkx/clash-subscription-updater.git'
	'clash-subscription-updater@.service'
)
sha256sums=(
	'SKIP'
	'3ad08345ee3482597073996cf2282f8880dc6b59d86863a6c12b8c081ecddf05'
)

pkgver() {
	cd "clash-subscription-updater"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${_pkgname_raw}"
	make build
}

package() {
	cd "$srcdir/${_pkgname_raw}"
	install -Dm644 "$srcdir/${_pkgname_raw}/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm +x "build/$_pkgname_raw" ${pkgdir}/usr/bin/${_pkgname_raw}
	install -Dm644 "$srcdir/$_pkgname_raw@.service" "$pkgdir"/usr/lib/systemd/system/$_pkgname_raw@.service
}
