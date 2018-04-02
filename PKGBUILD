# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds
pkgname=skeema-git
_pkgname=skeema
pkgver=r147.4930f00
pkgrel=1
pkgdesc="A tool for managing MySQL tables and schema changes"
arch=(x86_64)
url="https://github.com/skeema/skeema"
license=(Apache)

source=("git+https://github.com/skeema/skeema.git")
sha256sums=('SKIP')

makedepends=(git go)
provides=(skeema)
conflicts=(skeema skeema-git)
options=('!strip')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "gopath/src/github.com/skeema"
	export GOPATH=$PWD/gopath
	mv $_pkgname gopath/src/github.com/skeema

	go install -v github.com/skeema/skeema
}

package() {
	mkdir -p $pkgdir/usr/bin

	cp $srcdir/gopath/bin/$_pkgname $pkgdir/usr/bin
}
