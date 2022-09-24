# Maintainer: Cedric Mamo <vrighter@gmail.com>
pkgname=digisim-git
pkgver=1
pkgrel=3
pkgdesc="A digital logic simulator programmed in lua"
arch=('x86_64')
url=""
license=('unknown')
groups=()
depends=('luajit')
makedepends=('git' 'zig-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('digisim::git+https://github.com/VrIgHtEr/digisim.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    
    val="$(git describe)"
    ver="${val%%-*}"
    if [ "$val" == "$ver" ]; then
        ver="${ver}_0"
    else
        ver="${ver}_$(echo "$val" | awk -F- '{print $2}')"
    fi
    echo $ver
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	zig build -Drelease-fast=true
}

check() {
	cd "$srcdir/${pkgname%-git}"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    mv "zig-out" "$pkgdir/usr"
}

