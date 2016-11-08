# Maintainer: Hendrik Sollich <hendrik@hoodie.de>
_pkgname=asciii
pkgname=${_pkgname}-git
pkgver=3.0.0 # auto
pkgrel=1
makedepends=('rust' 'cargo' 'cmake')
arch=('i686' 'x86_64')
source=("git+https://github.com/ascii-dresden/asciii-rs.git")
md5sums=('SKIP')
replaces=('asciii')
license=('MIT/Apache-2.0')



pkgver() {
    cd "$srcdir/asciii-rs/"
    #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    echo $(git tag | tail -1).$(git rev-list --count HEAD)
}

build() {
    cd "$srcdir/asciii-rs/"
    cargo build --release
}

package() {
    cd "$srcdir/asciii-rs/"
    target="$srcdir/asciii-rs/target/release/$_pkgname"
    install -Dm755 $target "$pkgdir/usr/bin/$_pkgname"
}
