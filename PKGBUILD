# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=retroarch-assets
pkgname=$_pkgname-git
pkgver=1.19.0.r13.gc4f1ec8bd
pkgrel=1
pkgdesc="Assets needed for RetroArch"
arch=('any')
url="https://github.com/libretro/retroarch-assets"
license=('CC-BY-4.0')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname" retroarch-assets-{glui,ozone,xmb})
conflicts=("$_pkgname")
options=('!strip')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	install -d "$pkgdir"/usr/share/libretro/assets
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr/share/libretro/assets \
		branding \
		ctr \
		glui \
		nxrgui \
		ozone \
		pkg \
		rgui \
		sounds \
		switch \
		wallpapers \
		xmb
}
