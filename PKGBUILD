# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Matthew Hiles <matthew.hiles@gmail.com>
pkgname=inkscape-silhouette-git
pkgver=r347.eae9652
pkgrel=1
pkgdesc="inkscape plugin to control Silhouette vinyl cutters"
arch=(any)
url="https://github.com/fablabnbg/inkscape-silhouette"
license=('GPLv2')
groups=()
depends=(inkscape python2 python2-lxml python2-pyusb)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fablabnbg/inkscape-silhouette')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py install --root="$pkgdir/"
	mkdir -p "$pkgdir/usr/share/inkscape/extensions/"
	cp sendto_silhouette.* "$pkgdir/usr/share/inkscape/extensions/"
	cp -R silhouette "$pkgdir/usr/share/inkscape/extensions/"
}
