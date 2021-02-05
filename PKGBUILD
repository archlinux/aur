# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: slact
pkgname=tlpui-git
pkgver=1.3.1.7.r0.gee1d732
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
            '347fad2e6cf02d01d770b654f8b2da1f8aaa0ac37097f84ef6bc4053bd7fcae4')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^tlpui.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
		"$pkgdir/usr/share/applications"
}
