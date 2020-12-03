# Maintainer: Emilio Reggi <nag@mailbox.org>
pkgname=bombadillo-git
_pkgname=bombadillo
_source=https://tildegit.org/sloum/bombadillo.git
pkgver=r462.757305d
pkgrel=2
pkgdesc="Bombabillo is a non-web client for the terminal, supporting Gopher, Gemini and much more."
arch=('x86_64')
url="https://tildegit.org/sloum/bombadillo.git"
license=('GPL')
makedepends=('go' 'git')
optdepends=('desktop-file-utils: create desktop entry')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::"git+${_source}")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make PREFIX=/usr
}

package() {
	cd "$_pkgname"
	make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
