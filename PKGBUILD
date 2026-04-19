# Maintainer: gigas002 <gigas002@pm.me>

pkgname=sweet-cursors-git
_reponame=Sweet
_pkgname=Sweet-cursors
pkgver=r445.1d92ac7
pkgrel=1
pkgdesc="Sweet cursors KDE theme"
arch=('any')
url="https://github.com/Gigas002/$_reponame"
license=('GPL-3.0-only')
makedepends=('git' 'inkscape' 'xorg-xcursorgen')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
source=("$_reponame::git+$url.git#branch=cursors")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_reponame/kde/cursors"
	chmod +x build_scalable.sh
	chmod +x build.sh

	./build_scalable.sh
	./build.sh
}

package() {
	install -d "$pkgdir/usr/share/icons"
	cp -r "$srcdir/$_reponame/kde/cursors/$_pkgname" "$pkgdir/usr/share/icons"
}
