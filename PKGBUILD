# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=munin-template-munstrap-git
pkgver=r25.c3431051
# Changed versioning scheme to prevent rebuilds
# Thanks to eschwarz for recommending
epoch=1
pkgrel=1
pkgdesc="Bootstrap based template for munin-html"
arch=('any')
url="https://github.com/munin-monitoring/contrib/tree/master/templates/munstrap"
license=('GPL2')
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/munin-monitoring/contrib.git")
md5sums=('SKIP')

pkgver() {
	local subdir="templates/munstrap"
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD "$subdir")" "$(git log -n 1 --pretty=format:%h -- "$subdir")"
}

package() {
	local destdir="$pkgdir/usr/share/munin/templates/munstrap"
	cd "$srcdir/${pkgname%-git}"
	install -d "$destdir"
	cp -r templates/munstrap/{templates,static} "$destdir"
}
