# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeng at proton dot me>
# Contributor: Awalon <git at awalon dot de>

pkgname=sours-full-color-icon-theme-git
pkgver=2025.10.27.a7027ca
pkgrel=1
pkgdesc="Sours is an icon theme for Linux with tasty gradients, rounded lines, and color coordination"
arch=(any)
url=https://github.com/tully-t/Sours
license=(GPL3)
depends=('gtk-update-icon-cache')
makedepends=('git')
options=(!strip !emptydirs)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "%s" "$(TZ=UTC0 git show --no-patch --format="%ad.%h" --date="format:%Y.%m.%d" HEAD)"
}

package() {
	cd "$pkgname/Sours-Full-Color"
	# remove invalid files (with spaces), which will break gtk-update-icon-cache
	find . -type f -iname "* *" -delete
	install -d "$pkgdir/usr/share/icons"
	cp -r ./ "$pkgdir/usr/share/icons/Sours-Full-Color"
}
