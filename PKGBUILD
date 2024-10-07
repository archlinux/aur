# Maintainer: A. Jack Roehr <jack at roe dot hr>
pkgname=vim_cubed-git
pkgver=r21.ea33fc7
pkgrel=1
pkgdesc='Vim rendered on a cube for no reason'
arch=('i686' 'x86_64')
url="https://github.com/oakes/vim_cubed"
license=('Unlicense')
depends=('glibc' 'libglvnd')
makedepends=('git' 'mesa' 'ncurses' 'nim' 'nimble' 'xorg-server-devel' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi')
source=("vim_cubed::git+https://github.com/oakes/vim_cubed#branch=master")
sha256sums=("SKIP")

_reponame="vim_cubed"

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "$srcdir/$_reponame"
	nimble install -y paravim
	nimble install -y
}

package () {
	cd "$srcdir/$_reponame"
	install -Dm755 vim3 "$pkgdir"/usr/bin/vim3
}
