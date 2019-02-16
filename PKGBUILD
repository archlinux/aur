# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>

pkgname=bum-git
pkgver=r54.004d795
pkgrel=2
pkgdesc="Download and display album art for mpd/mopidy tracks."
arch=('any')
url="https://github.com/dylanaraps/bum"
license=('Apache License, Version 2.0')
groups=()
depends=('python' 'python-mpv' 'python-musicbrainzngs' 'python-mpd2')
makedepends=('python-setuptools' 'git' 'python-mpv')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/dylanaraps/bum.git")
md5sums=('SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
