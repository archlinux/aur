# Maintainer: Jack Roehr <jack at roe dot hr>
pkgname=vim_cubed-git
pkgver=r0.0
pkgrel=1
pkgdesc='Vim rendered on a cube for no reason'
arch=('i686' 'x86_64')
url="https://github.com/oakes/vim_cubed"
license=('UNLICENSE')
depends=('mesa' 'ncurses')
makedepends=('nim' 'nimble' 'xorg-server-devel' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi')
source=("vim_cubed::git+https://github.com/oakes/vim_cubed#branch=master")
sha256sums=("SKIP")

reponame="vim_cubed"
builddir="build"

pkgver() {
	cd "$srcdir/$reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "$srcdir/$reponame"
	nimble install -y paravim
	nimble install -y
}

package () {
	cd "$srcdir/$reponame"
	install -Dm755 vim3 "$pkgdir"/usr/bin/vim3
}
