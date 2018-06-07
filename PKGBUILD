# Maintainer: Wei Li <liwei@anbutu.com>
pkgname=ccloudvm-git
pkgver=r310.f1bdd5d
pkgrel=1
pkgdesc="Configurable Cloud VM (ccloudvm) is a command line tool for creating and managing Virtual Machine (VM) based development environments"
arch=('i686' 'x86_64')
url="https://github.com/intel/ccloudvm"
license=('Apache')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	
	local _srcpath="src/github.com/intel/"
	export GOPATH="${srcdir}"
	install -d "$GOPATH/$_srcpath"
	ln -sf "$(pwd)" "$GOPATH/$_srcpath/${pkgname%-git}"
	cd "$GOPATH/$_srcpath/${pkgname%-git}"

	go build .
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D ccloudvm "$pkgdir/usr/bin/ccloudvm"
}
