# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=retroarch-assets
pkgname=$_pkgname-git
pkgver=r424.f45dd135
pkgrel=1
pkgdesc="Assets needed for RetroArch"
arch=('any')
url="https://github.com/libretro/retroarch-assets"
license=('CCPL:by')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm $_pkgname/xmb/convert.sh
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -d "$pkgdir"/usr/share/libretro/assets
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr/share/libretro/assets \
		branding \
		ctr \
		glui \
		menu_widgets \
		nxrgui \
		ozone \
		pkg \
		rgui \
		sounds \
		switch \
		wallpapers \
		xmb
}
