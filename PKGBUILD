# Maintainer: Jeremy Kescher <jeremy@kescher.at>

pkgbase=hyprland-plugins-git
pkgname=(borders-plus-plus-git csgo-vulkan-fix-git hyprbars-git)
pkgver=r43.16dc292
pkgrel=1
pkgdesc="Official plugins for hyprland"
arch=(x86_64 aarch64)
url="https://github.com/hyprwm/hyprland-plugins"
license=('BSD')
makedepends=(hyprland)
source=($pkgbase::git+https://github.com/hyprwm/hyprland-plugins.git)
sha256sums=('SKIP')

pkgver() {
	cd "$pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgbase"
	
	for pkg in ${pkgname[@]};	do
		pushd ${pkg%%-git} >/dev/null
		make all &
		popd >/dev/null
	done
	wait
}

package_borders-plus-plus-git() {
	provides=(borders-plus-plus)
	conflicts=(borders-plus-plus)
	pkgdesc="Hyprland plugin that allows you to add one or two additional borders to your windows"
	
	cd "$srcdir/$pkgbase/borders-plus-plus"
	install -Dm755 borders-plus-plus.so "$pkgdir/usr/lib/hyprland-plugins/borders-plus-plus.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/borders-plus-plus-git/LICENSE"
}

package_csgo-vulkan-fix-git() {
	provides=(csgo-vulkan-fix)
	conflicts=(csgo-vulkan-fix)
	pkgdesc="Hyprland plugin that allows you to pick any resolution in CS:GO when using Vulkan"
	
	cd "$srcdir/$pkgbase/csgo-vulkan-fix"
	install -Dm755 csgo-vulkan-fix.so "$pkgdir/usr/lib/hyprland-plugins/csgo-vulkan-fix.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/csgo-vulkan-fix-git/LICENSE"
}

package_hyprbars-git() {
	provides=(hyprbars)
	conflicts=(hyprbars)
	pkgdesc="Hyprland plugin that adds simple title bars to windows"
	
	cd "$srcdir/$pkgbase/hyprbars"
	install -Dm755 hyprbars.so "$pkgdir/usr/lib/hyprland-plugins/hyprbars.so"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/hyprbars-git/LICENSE"
}
