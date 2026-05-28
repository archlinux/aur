# Maintainer: Ted pheenty Lukin <fedorlukin2006@gmail.com>

pkgname=lacy
pkgver=v0.7.1
pkgrel=1
pkgdesc="Fast magical cd alternative for lacy terminal navigators"
arch=(any)
url="https://github.com/timothebot/lacy"
license=('MIT')
makedepends=(git cargo)
source=("git+$url#tag=$pkgver")
install='lacy.install'
md5sums=('SKIP')

prepare() {
    # if user has pacman-installed rustup but it has no toolchain
    if command -v /usr/bin/rustup &> /dev/null && ! /usr/bin/rustup show active-toolchain &> /dev/null; then
        rustup default stable
    fi

    cd "$pkgname"
    cargo fetch --locked
}

build() {
    cd "$pkgname"
    cargo build -r --frozen
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
