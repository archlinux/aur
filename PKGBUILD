# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>

pkgname=python-chump-git
pkgver=r98.f89e93c
pkgrel=1
pkgdesc="The Best API Wrapper for Pushover."
arch=('any')
url="http://chump.readthedocs.org/"
license=('Apache License, Version 2.0')
groups=()
depends=('python')
makedepends=('python-setuptools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/karanlyons/chump.git")
md5sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	2to3 -wn .
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root "${pkgdir}/"
}
