# Maintainer: Josh Klar <j@iv597.com>
pkgname=silentarmy-git
pkgver=3.0.1
pkgrel=2
_gittarget='adea4e582a728438d6adaa4b4a41ef9645496062'
pkgdesc="GPU Zcash Equihash solver"
arch=('i686' 'x86_64')
url="https://github.com/mbevand/silentarmy"
license=('MIT')
conflicts=('silentarmy')
provides=('silentarmy')
groups=()
depends=('libcl' 'opencl-headers' 'python')

_gitroot='https://github.com/mbevand/silentarmy.git'
_gitname='silentarmy'

build() {
	cd "$srcdir"
	msg "Connecting to GIT server..."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	cd "$srcdir/$_gitname"

	make
}

check() {
	cd "$srcdir/$_gitname"
	make test
}

package() {
	cd "$srcdir/$_gitname"
	mkdir -p "$pkgdir/usr/bin"
	install silentarmy "$pkgdir/usr/bin/"
	install sa-solver "$pkgdir/usr/bin/"
}
