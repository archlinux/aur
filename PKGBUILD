# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
pkgbase=decpwd
pkgname=decpwd-git
pkgver=r7.21b5f75
pkgrel=1
pkgdesc="Very simple password manager to use over ssh"
arch=("x86_64")
url="https://github.com/suthernfriend/decpwd"
license=('MIT')
depends=('qt5-base')
makedepends=('git')
provides=("decpwd")
conflicts=("decpwd")
source=('git+https://github.com/suthernfriend/decpwd.git')
noextract=()
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/decpwd"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/decpwd"
        qmake -o ./build/Makefile
        cd "./build"
	make
}

package() {
        cd "$srcdir/decpwd/build"
        install -Dm 755 "decpwd" "$pkgdir/usr/bin/decpwd"
}
