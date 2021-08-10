# Maintainer: mnabila nblid48[at]gmail[dot]com

pkgname=stylua-git
pkgver=0.10.1.r0.g69fc9d9
pkgrel=1
pkgdesc='An opinionated code formatter for Lua 5.1 and Luau, built using full-moon.'
url='https://github.com/JohnnyMorganz/StyLua'
source=("${pkgname}::git+https://github.com/JohnnyMorganz/StyLua.git")
arch=('any')
license=('MPL-2.0')
conflicts=('stylua-bin')
sha256sums=('SKIP')
depends=('rust')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "$srcdir/$pkgname"
    cargo build --locked --release --all-features
}

package() {
    cd "$srcdir/$pkgname/target/release"
    install -Dm755 stylua "${pkgdir}/usr/bin/stylua"
}
