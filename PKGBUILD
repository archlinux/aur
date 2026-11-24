# Maintainer: Phil Kulak <phil@kulak.us>
pkgname=matui-classic
_pkgname=matui
pkgver=1.1.0
pkgrel=1
pkgdesc="An opinionated Matrix TUI client, for homeservers without sliding sync."
makedepends=('cargo')
checkdepends=('ffmpeg')
optdepends=('ffmpeg: thumbnails for uploaded videos and animated images')
arch=('x86_64')
url="https://github.com/pkulak/matui/tree/classic"
license=('GPL2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pkulak/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c9ca0e2be57464e1cd8790e82fc0fb9ebf5fee856101338a00e5c634b9750bb31cc84c6788875a5dc531e8d45974802bc77f3cd0c57b796f5cb56a478a6dc6e1')

build() {
    cd "$_pkgname-$pkgver"
    env -u CFLAGS -u CXXFLAGS -u LDFLAGS cargo build --release --locked --all-features
}

check() {
    cd "$_pkgname-$pkgver"
    env -u CFLAGS -u CXXFLAGS -u LDFLAGS cargo test --release --locked
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
}
