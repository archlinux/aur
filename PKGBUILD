# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
depends=(
	gcc-libs
	glibc
	libdrm
	libevdev
	expat
	libffi
	libxkbcommon
	mesa
	opus
	wayland
)
provides=(moonshine)
conflicts=(moonshine)

source=(
	"https://github.com/hgaiser/moonshine/releases/download/v$pkgver/moonshine-v$pkgver-linux-amd64.tar.zst"
)
sha256sums=('fe7b83d0d85ceb864888c3c848cfbce75b51f3cc0f839649f6ec6956f61e148f')

package() {
	cd "$srcdir/moonshine"

	install -Dm755 bin/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 share/moonshine/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 share/moonshine/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 share/moonshine/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm644 share/moonshine/VkLayer_moonshine_wsi.json "$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_moonshine_wsi.json"
	install -Dm755 lib/moonshine/vulkan-layers/libmoonshine_wsi.so "$pkgdir/usr/lib/moonshine/vulkan-layers/libmoonshine_wsi.so"
	install -Dm644 share/moonshine/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"

	install -Dm644 share/moonshine/50-moonshine-inhibit-sleep.rules "$pkgdir/usr/share/polkit-1/rules.d/50-moonshine-inhibit-sleep.rules"
	install -Dm644 share/moonshine/moonshine-sysusers.conf "$pkgdir/usr/lib/sysusers.d/moonshine.conf"
}
