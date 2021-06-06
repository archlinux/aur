# Maintainer: FallenWarrior2k <aur@sl.fallenwarrior.dev>

pkgname=xbgdump
pkgver=0.1.4
pkgrel=2
pkgdesc='CLI tool to dump the X11 background to a file'
url='https://github.com/FallenWarrior2k/xbgdump'
license=(MIT)
arch=(x86_64)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a462900872c4672be0c9c2d438688c1dec609a8f995fb748cab9fca41789ea3d')
sha512sums=('357cb545b526bcaebfa468fcd48cbba73fd492b235d7acf6978af381186d73e233366da54eab00d9563cfbaf3ad6c8a49d73f4dc20a4f42bcc82c86a807ff17d')
b2sums=('f3cf4622a9a13daf221e592cf158ab0474ebddf6cdd8cad331db2345fbf70bcc409786c6f753c724f56ae0360c97af6bd235828ea1c2211d07184462b7141190')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
    cd $pkgname-$pkgver
    cargo build --release --frozen --all-features --target-dir=target
}

package() {
    cd $pkgname-$pkgver
    install -Dt "$pkgdir"/usr/bin -m755 target/release/$pkgname
    install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 LICENSE
    install -Dt "$pkgdir"/usr/share/doc/$pkgname -m644 README.md
}
