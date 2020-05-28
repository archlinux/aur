# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: slact
pkgname=tlpui-git
pkgver=0.1.r125.668ec8d
pkgrel=1
epoch=2
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/d4nj1/TLPUI.git"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'a8f7a4a3d1c66c27383f75b092fa71c3e7cd72b8240a06ed00ad56be3b5338ea')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "$(python setup.py --version).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
		"$pkgdir/usr/share/applications"
}
