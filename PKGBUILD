# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=qogir-cursors-git
_gitname=Qogir-icon-theme
pkgver=2020.02.21.r10.gf76c584c
pkgrel=1
pkgdesc="An X Cursor theme inspired by Qogir theme and based on capitaine-cursors"
url="https://www.pling.com/p/1366182"
arch=('any')
license=('GPL3')
makedepends=('inkscape' 'xorg-xcursorgen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
_commit='f76c584ca4e682a721b69cc2f689cb07213b4554'
source=("git+https://github.com/vinceliuice/Qogir-icon-theme.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_gitname/src/cursors"

	# Remove prebuilt assets
	rm -rf {dist,dist-dark}
}

build() {
	cd "$srcdir/$_gitname/src/cursors"
	./build.sh
}

package() {
	cd "$srcdir/$_gitname/src/cursors"
	install -dm755 "$pkgdir"/usr/share/icons/{"${pkgname%-git}",qogir-white-cursors}
	cp -dr --no-preserve=ownership dist/* "$pkgdir/usr/share/icons/${pkgname%-git}"
	cp -dr --no-preserve=ownership dist-dark/* "$pkgdir/usr/share/icons/qogir-white-cursors"
}
