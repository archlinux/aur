# Maintainer: Frantic1048 <archer@frantic1048.com>
pkgdesc='A simple Lua wrapper to graphicsmagick.'
pkgname='lua51-graphicsmagick-git'
pkgver=r117.309c7fb
pkgrel=1
makedepends=('git')
depends=('torch7-git>=r819')
conflicts=('lua51-graphicsmagick')
provides=('lua51-graphicsmagick')
arch=('x86_64' 'i686')
url='https://github.com/clementfarabet/graphicsmagick'
license=('unknown')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package () {
	cd "${pkgname}"

	install -d "${pkgdir}/usr/share/lua/5.1/graphicsmagick"

	for f in ./*.lua
	do
		install -m755 "$f" "${pkgdir}/usr/share/lua/5.1/graphicsmagick/"
	done
}
