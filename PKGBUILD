# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >
# https://wiki.archlinux.org/index.php/Rust_package_guidelines

pkgname=agate
pkgver=1.2.2
pkgrel=1
pkgdesc="Agate is a server for the Gemini network protocol, built with the Rust programming language. Agate has very few features, and can only serve static files."
makedepends=('cargo')
arch=('x86_64')
url="https://github.com/mbrubeck/agate"
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "use-latest-deps.patch")
license=('APACHE' 'MIT')
sha512sums=('9d4fe7f7d7fd49294ca6878edcfb844a5c2bcf736e1040aa40799bb7957126a9ffcf49315c0a081dced2b1f215ab987c4d3b2fbfafb38dada170b2c318ddbecf' '0e1e49ed86f962bc66123572f225c958a8c9d8563d18b236796935f2e900b1c8fedc43b238778214429b3934303969f4eeafdd1b2e7ac3dd0b9eda8b2a8c059e')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "../../use-latest-deps.patch"
}

build() {
    cd $pkgname-$pkgver
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd $pkgname-$pkgver
    cargo test --release --locked --target-dir=target
}

package() {
    cd $pkgname-$pkgver
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
