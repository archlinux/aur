# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-bin
pkgver=0.17.2
pkgrel=1
pkgdesc="Streaming server for Moonlight clients, written in Rust."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('BSD-2-Clause')
depends=(
	expat
	gcc-libs
	glibc
	libdrm
	libevdev
	libffi
	libxkbcommon
	mesa
	opus
	wayland
	xorg-xwayland
)
provides=(moonshine)
conflicts=(moonshine)

source=(
	"https://github.com/hgaiser/moonshine/releases/download/v$pkgver/moonshine-v$pkgver-linux-amd64.tar.zst"
)
sha256sums=('b7a92ee99dd0a6beff1970d9a8759a8a845371e4caa90dd9ce0ec39cc5c61376')

package() {
	cd "$srcdir/moonshine"

	install -Dm755 bin/moonshine "$pkgdir/usr/bin/moonshine"
	install -Dm755 share/moonshine/start-moonshine.sh "$pkgdir/usr/bin/start-moonshine.sh"
	install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 share/moonshine/moonshine@.service "$pkgdir/usr/lib/systemd/system/moonshine@.service"
	install -Dm644 share/moonshine/60-moonshine.rules "$pkgdir/usr/lib/udev/rules.d/60-moonshine.rules"
	install -Dm755 lib/ferriscope/libferriscope_wsi.so "$pkgdir/usr/lib/ferriscope/libferriscope_wsi.so"
	install -Dm644 share/vulkan/implicit_layer.d/VkLayer_FERRISCOPE_wsi.x86_64.json \
		"$pkgdir/usr/share/vulkan/implicit_layer.d/VkLayer_FERRISCOPE_wsi.x86_64.json"
	install -Dm644 share/moonshine/moonshine-modules.conf "$pkgdir/usr/lib/modules-load.d/moonshine.conf"

	install -Dm644 share/moonshine/50-moonshine-inhibit-sleep.rules "$pkgdir/usr/share/polkit-1/rules.d/50-moonshine-inhibit-sleep.rules"
	install -Dm644 share/moonshine/moonshine-sysusers.conf "$pkgdir/usr/lib/sysusers.d/moonshine.conf"
}
