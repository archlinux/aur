# Maintainer: Kyle Dixon <mrkylezd at gmail dot com>
pkgname=localcdn-chromium-git
pkgver=v2.6.19
pkgrel=1
pkgdesc="A web browser extension that emulates CDNs to improve your online privacy."
arch=('any')
url="https://codeberg.org/nobody/LocalCDN.git"
license=('MPL2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url#tag=$pkgver")
validgpgkeys=(3F59043BE267E1B1177688AC8F6DE3D614FCFD7A) # nobody <info@localcdn.org>
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# create install dir
	mkdir -p "$pkgdir/usr/share/${pkgname%-git}"

	# install extension files
	cp -a _locales core icons modules pages resources manifest.json "$pkgdir/usr/share/${pkgname%-git}"
}
