# Maintainer: timescam <rex.ky.ng at gmail dot com>

pkgname=dvdts-git
_pkgname="dvdts"
pkgver=r17.7a7bdd0
pkgrel=1
pkgdesc="Terminal screensaver similar to dvd bouncing logo; Uses the distro/OS name/custom text instead"
arch=('any')
url="https://github.com/ameyrk99/dvdts"

depends=(
  'go'
)
makedepends=(
  'git'
)

provides=('dvdts')


source=("$_pkgname::git+https://github.com/ameyrk99/dvdts.git")

md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"

	rm -rf "$srcdir/.go/src"

	mkdir -p "$srcdir/.go/src"

	export GOPATH="$srcdir/.go"

	mv "$srcdir/$_pkgname" "$srcdir/.go/src/"

	cd "$srcdir/.go/src/$_pkgname/"
	ln -sf "$srcdir/.go/src/$_pkgname/" "$srcdir/$_pkgname"

	echo "Running 'go get'..."
	go get
}

package() {
	install -Dm755 "$srcdir/.go/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
