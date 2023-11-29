# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgbase=hyprland-plugins-git
pkgname=(hyprland-plugin-borders-plus-plus-git hyprland-plugin-csgo-vulkan-fix-git hyprland-plugin-hyprbars-git hyprland-plugin-hyprtrails-git hyprland-plugin-hyprwinwrap-git)
pkgver=r92.b225987
pkgrel=1
pkgdesc="Official plugins for hyprland"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprland-plugins"
license=('BSD')
makedepends=(hyprland-git git)
source=($pkgbase::git+https://github.com/hyprwm/hyprland-plugins.git)
sha256sums=('SKIP')

pkgver() {
	cd "$pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgbase"

	for pkg in ${pkgname[@]}; do
		pkg=${pkg##hyprland-plugin-}
		pushd ${pkg%%-git} >/dev/null
		make all &
		popd >/dev/null
	done
	wait
}

package_hyprland-plugin-borders-plus-plus-git() {
	provides=(hyprland-plugin-borders-plus-plus)
	pkgdesc="Hyprland plugin that allows you to add one or two additional borders to your windows"
	
	cd "$srcdir/$pkgbase/borders-plus-plus"
	install -Dm755 borders-plus-plus.so "$pkgdir/usr/lib/hyprland-plugins/borders-plus-plus.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-borders-plus-plus-git/LICENSE"
}

package_hyprland-plugin-csgo-vulkan-fix-git() {
	provides=(hyprland-plugin-csgo-vulkan-fix)
	pkgdesc="Hyprland plugin that allows you to pick any resolution in CS:GO when using Vulkan"
	
	cd "$srcdir/$pkgbase/csgo-vulkan-fix"
	install -Dm755 csgo-vulkan-fix.so "$pkgdir/usr/lib/hyprland-plugins/csgo-vulkan-fix.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-csgo-vulkan-fix-git/LICENSE"
}

package_hyprland-plugin-hyprbars-git() {
	provides=(hyprland-plugin-hyprbars)
	pkgdesc="Hyprland plugin that adds simple title bars to windows"
	
	cd "$srcdir/$pkgbase/hyprbars"
	install -Dm755 hyprbars.so "$pkgdir/usr/lib/hyprland-plugins/hyprbars.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprbars-git/LICENSE"
}

package_hyprland-plugin-hyprtrails-git() {
	provides=(hyprland-plugin-hyprtrails)
	pkgdesc="Hyprland plugin that adds trails behind windows"
	
	cd "$srcdir/$pkgbase/hyprtrails"
	install -Dm755 hyprtrails.so "$pkgdir/usr/lib/hyprland-plugins/hyprtrails.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprtrails-git/LICENSE"
}

package_hyprland-plugin-hyprwinwrap-git() {
	provides=(hyprland-plugin-hyprwinwrap)
	pkgdesc="Hyprland plugin that acts like Xwinwrap."
	
	cd "$srcdir/$pkgbase/hyprwinwrap"
	install -Dm755 hyprwinwrap.so "$pkgdir/usr/lib/hyprland-plugins/hyprwinwrap.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprland-plugin-hyprwinwrap-git/LICENSE"
}
