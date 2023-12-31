# Maintainer: Tobias Hänel <aur@tobias-haenel.de>
# Contributor: mnabila <nblid48@gmail.com>

_pkgname=stylua52
pkgname=$_pkgname-git
pkgver=0.19.1.r29.gfa568d5
pkgrel=1
pkgdesc="An opinionated code formatter for Lua 5.2, built using full-moon."
url='https://github.com/JohnnyMorganz/StyLua'
source=("${_pkgname}::git+https://github.com/JohnnyMorganz/StyLua.git")
arch=(x86_64)
license=('MPL2')
sha512sums=('SKIP')
depends=(glibc gcc-libs)
makedepends=(rust git)

pkgver() {
	git -C $_pkgname describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "$srcdir/$_pkgname"
    cargo build --locked --release --features lua52
}

package() {
    cd "$srcdir/$_pkgname/target/release"
    install -Dm755 stylua "${pkgdir}/usr/bin/stylua52"
}
