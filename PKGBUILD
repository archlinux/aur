_gitname=irixium
pkgbase=irixium-theme-git
pkgname=(
	# Broken into each package as it is split on pling, but taken from the repo.
	# This means the Pling page can be labeled as the upstream for each package.
	
	# Pling
	#
	# Plasma Color Scheme
	'irixium-plasma-colorscheme-git'
	# Plasma Theme
	'irixium-plasma-style-git'
	# Plasma 6 Window Decoration
	'irixium-aurorae-theme-git'
	# Global Theme (Plasma 6)
	'plasma6-theme-irixium-git'
	# Kvantum
	'kvantum-theme-irixium-git'
	# Abstract
	#  The "Abstract" package on pling just contains desktop backgrounds
	'irixium-backgrounds-git'
	# Global Theme (Plasma 5)
	#  While present on Pling, it's last update was 3.2 2 years ago, and at time
	#  of writing, the plasma6 is 6.1 3 days ago.
	#  This doesn't mean it is't up-to-date, but I doubt it.
	#  plasma5 themes on the AUR are sparse, however, so for now I'll keep this as-is.
	# Plasma Color Scheme
	## SDDM Login Themes
	'sddm-irixium-theme-git'
	# Plasma Window Decorations
	#  As with the earlier plasma 5 thing, I don't think this is maintained.
	# Full Icon Themes
	'irixium-icons-git'
	# Ice-WM Themes
	#  As with the plasma5 stuff, this hasn't seen updates in a long time. I can add it if there's a request.
	
	# TODO: the qt theme should, eventually, optionally depend on the seperately packaged gtk irix themes I may package later
)
pkgdesc="Modern take on Indigo Magic for Plasma"
pkgver=r184.ddbdc26
pkgrel=1
arch=('any')
url="https://www.opencode.net/phob1an/irixium"
licence=('GPL-3.0-only')
source=("git+${url}")
md5sums=( 'SKIP' )

pkgver() {
	cd "$srcdir/$_gitname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_irixium-plasma-colorscheme-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (Colors)"
	provides=('irixium-plasma-colorscheme')
	url="https://www.pling.com/p/1457776"
	# Copying behavior of catppuccin-plasma-colorscheme-latte
	depends=('plasma-desktop')

	cd "$srcdir/$_gitname"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/color-schemes/"
	cp -rf "./Irixium.colors" "${pkgdir}/usr/share/color-schemes/"
}
package_irixium-plasma-style-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (Plasma Style)"
	provides=('irixium-plasma-style')
	url="https://www.pling.com/p/1457753"
	depends=('plasma-desktop')
	# Neither are bundled
	# TODO: FreeSans font
	#  Can't find it standalone
	# TODO: 'Libre Franklin' font
	#  This font has 3 packages availabe for it, but no consistent name I can use here
	#optdepends=()

	cd "$srcdir/$_gitname"
	
	install -Dm644 "./desktoptheme/irixium/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme/"
	cp -rf "./desktoptheme/irixium" "${pkgdir}/usr/share/plasma/desktoptheme/"
}
package_irixium-aurorae-theme-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (Window Decorations)"
	provides=('irixium-aurorae-theme')
	url="https://www.pling.com/p/2142963"
	depends=('kwin')
	
	cd "$srcdir/$_gitname"

	install -Dm644 "./themes/irixium/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/aurorae/themes/"
	cp -rf "./themes/irixium" "${pkgdir}/usr/share/aurorae/themes/"
}
package_plasma6-theme-irixium-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (Global Theme)"
	provides=('plasma6-theme-irixium')
	url="https://www.pling.com/p/2142966"
	depends=(
		irixium-aurorae-theme-git
		irixium-plasma-colorscheme-git
		irixium-plasma-style-git
		irixium-icons-git
		irixium-backgrounds-git
		sddm-irixium-theme-git
	#)
	#optdepends=(
	#	'kvantum-theme-irixium-git: Kvantum support'
		'kvantum-theme-irixium-git'
	)

	cd "$srcdir/$_gitname"

	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/"
	cp -rf "./look-and-feel/org.magpie.irixium.desktop" "${pkgdir}/usr/share/plasma/look-and-feel/"
}
package_kvantum-theme-irixium-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (Kvantum Theme)"
	provides=('kvantum-theme-irixium')
	url="https://www.pling.com/p/1457738"
	depends=('kvantum')

	cd "$srcdir/$_gitname"

	install -Dm644 "./Kvantum/Irixium/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/Kvantum/"
	cp -rf "./Kvantum/Irixium" "${pkgdir}/usr/share/Kvantum/"
}
package_irixium-backgrounds-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (Wallpapers)"
	provides=('irixium-backgrounds')
	url="https://www.pling.com/p/1457745"

	cd "$srcdir/$_gitname"

	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/wallpapers/"
	cp -rf "./wallpapers/Irixium" "${pkgdir}/usr/share/wallpapers/"
}
package_sddm-irixium-theme-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (SDDM Login Screen)"
	provides=('sddm-irixium-theme')
	depends=(
		'sddm'
		#'inter-font' # bundled
	)
	url="https://www.pling.com/p/1673443"

	cd "$srcdir/$_gitname"

	install -Dm644 "./sddm/themes/Irixium/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/sddm/themes/"
	cp -rf "./sddm/themes/Irixium" "${pkgdir}/usr/share/sddm/themes/"
}
package_irixium-icons-git() {
	pkgdesc="Modern take on Indigo Magic for Plasma (Icons)"
	provides=('irixium-icons-git')
	url="https://www.pling.com/p/2142965"

	cd "$srcdir/$_gitname"

	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p "${pkgdir}/usr/share/icons/"
	cp -rf "./icons/Irixium" "${pkgdir}/usr/share/icons/"
}
