# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=morewaita-icon-theme-git
_reponame=MoreWaita
pkgver=49.r0.g7415d0e # Keep the g before the 7-character short commit ID
pkgrel=1
pkgdesc="An expanded Adwaita-styled companion icon theme with extra icons for popular apps to complement Gnome Shell's original icons. AUR package maintained by upstream developer."
arch=(any)
url="https://github.com/somepaulo/$_reponame"
license=(GPL3)
depends=(adwaita-icon-theme)
makedepends=(git)
provides=("morewaita-icon-theme" "morewaita")
conflicts=("${pkgname%-git}" "morewaita" "morewaita-git")
replaces=("morewaita-git")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	local themedir="$pkgdir/usr/share/icons/MoreWaita"
	install -d "$themedir"

	find "$_reponame" -name 'meson.build' -type f | xargs rm
	cp -r "$_reponame/scalable" "$themedir/scalable"
	cp -r "$_reponame/symbolic" "$themedir/symbolic"
	cp "$_reponame/index.theme" "$themedir/index.theme"
	cp "$_reponame/LICENSE" "$themedir/LICENSE"
}
