# Maintainer: getchoo <getchoo at tuta dot io>
pkgname=spongebob-cli-git
pkgver=r62.6fe6515
pkgrel=1
pkgdesc="Watch classic spongebob from the terminal!"
arch=(any)
url="https://github.com/trakBan/spongebob-cli"
license=('GPL3')
depends=('mpv' 'youtube-dl' 'python-requests' 'python-urllib3'
				'python-termcolor' 'python-beautifulsoup4' 'python-prettytable'
				'python-halo')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}#branch=main"
				"fix-imports.patch")
sha256sums=('SKIP'
            '0f57d260809e13f0cff08ea4158b38179395b28d5ec8791f58d2c1f8338f533d')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	patch -p1 -i "$srcdir/fix-imports.patch"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: set ts=2 sw=2 et:
