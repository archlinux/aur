# Maintainer: Amy <amy at fluff dot tech>

pkgname=sponsorblock-chromium-git
pkgver=2.1.2.r6.1b96e210
pkgrel=1
pkgdesc="SponsorBlock extension for chromium-based browsers"
arch=(any)
url="https://github.com/ajayyy/SponsorBlock"
license=('GPL')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# print version string
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	cp config.json.example config.json

	# install build-time dependencies using npm
	npm install
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# build extension
	npm run build
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# create install dir
	mkdir -p "$pkgdir/usr/share/"

	# install extension files
	cp -aT dist "$pkgdir/usr/share/${pkgname%-git}"
}
