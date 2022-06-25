# Maintainer: seth <getchoo at tuta dot io>

pkgname=spongebob-cli-git
pkgver=r109.4cc8c51
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
source=("${pkgname%-git}::git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim: set ts=2 sw=2 et:
