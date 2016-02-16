# Maintainer: Jacob Errington <archlinux@mail.jerrington.me>
pkgname=beluga-git
pkgver=v0.8.1.r190.3d50c74
pkgrel=1
pkgdesc="Beluga is a functional programming language designed for reasoning about formal systems. It features direct support for object-level binding constructs using higher order abstract syntax and treats contexts as first class objects."
arch=(x86_64)
url="http://complogic.cs.mcgill.ca/beluga/"
license=('GPL')
groups=()
depends=(ocaml ulex camlp4 ocaml-extlib)
makedepends=(git omake)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/Beluga-lang/Beluga.git#branch=master')
noextract=()
md5sums=('SKIP')
optdepends=('rlwrap: nice line wrapping')

pkgver() {
    cd "$srcdir/Beluga"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    mv "$srcdir/Beluga" "$srcdir/${pkgname%-git}"
    cd "$srcdir/${pkgname%-git}"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

check() {
    :
}

package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/bin"
    cp bin/beluga "$pkgdir/usr/bin/beluga"
}
