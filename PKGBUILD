# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
pkgname=tundra
pkgver=0.1.1
pkgrel=2
epoch=
pkgdesc="MyAnimeList scrobbler"
arch=('x86_64')
url="https://tundra.moe"
license=('GPL3')
groups=()
depends=('gtk3' 'dbus')
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/m4tx/$pkgname/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/erengy/anime-relations/2c55e0ce48462a75ca8680dc2a9828887aea1792/anime-relations.txt")
noextract=()
md5sums=('459cec687c6763f282478fc9a727f3b7'
         'ec26a1895b54f4f7a03538e117354311')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    cp "$srcdir/anime-relations.txt" "vendor/anime-relations/"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features
}

check() {
    return 0
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 755 data/moe.tundra.Tundra.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm 755 data/moe.tundra.Tundra.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
