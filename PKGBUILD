# Maintainer: Philipp Hochkamp <philipp.hochkamp@udo.edu>
pkgname=srandr
_pkgname=srandr
_pkgprefix=gitlab.com/ragon000/
pkgver=0.0.1
pkgrel=3
pkgdesc="srandr - A tool for managing your sway outputs"
arch=('i686' 'x86_64')
license=('GPL')
depends=(
  'sway'
)
makedepends=(
	'gcc-go'
        'dep'
	'git'
)

source=(
	"$_pkgname::git+https://gitlab.com/ragon000/srandr.git#tag=${pkgver}"
)

md5sums=(
	'SKIP'
)

prepare() {
        echo ":: Preparing go path stuff"
	cd "$srcdir/$_pkgname"

	rm -rf "$srcdir/go/src"

	mkdir -p "$srcdir/go/src/$_pkgprefix"

	export GOPATH="$srcdir/go"

	mv "$srcdir/$_pkgname" "$srcdir/go/src/$_pkgprefix"

	cd "$srcdir/go/src/$_pkgprefix$_pkgname/"
	ln -sf "$srcdir/go/src/$_pkgprefix$_pkgname/" "$srcdir/$_pkgname"
}

build() {
	cd "$srcdir/go/src/$_pkgprefix$_pkgname/"
	export GOPATH="$srcdir/go"

	echo ":: Building binary"
        make
}

package() {
	cd "$srcdir/go/src/$_pkgprefix$_pkgname/"
        mkdir -p $pkgdir/usr/bin
        install srandr $pkgdir/usr/bin/
}
