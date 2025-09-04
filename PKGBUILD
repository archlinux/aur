# Maintainer: ardency <stalqi@proton.me>

_pkgname=shell-plus-plus
pkgname="$_pkgname-git"
pkgver=r495.516c280
pkgrel=1
pkgdesc="A friendly and modern functional object oriented language for shell script."
arch=('x86_64')
url="https://github.com/alexst07/shell-plus-plus"
license=('Apache-2.0')
depends=('boost183-libs')
makedepends=('boost183' 'readline' 'cmake3-bin' 'git')
source=("git+https://github.com/alexst07/shell-plus-plus.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir build
	cd build
	cmake3 ..
	make
}

package() {
	install -Dm 755 "$srcdir/$_pkgname/build/shell/shpp" "$pkgdir/usr/bin/shpp"
}
