# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
pkgname=tundra
pkgver=0.5.3
pkgrel=2
epoch=
pkgdesc="MyAnimeList scrobbler"
arch=('x86_64')
url="https://tundra.moe"
license=('GPL3')
groups=()
depends=('gtk4' 'libadwaita' 'dbus')
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
        "anime-relations-$pkgver.txt::https://raw.githubusercontent.com/erengy/anime-relations/b043ceae054cf2b342c79e1be81c8b8836daedb3/anime-relations.txt")
noextract=()
md5sums=('955dafd19a779148aa8190131ff9e128'
         'f767b6337157627dcdd1ab52b9770ad7')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    cp "$srcdir/anime-relations-$pkgver.txt" "vendor/anime-relations/anime-relations.txt"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --all-features --target-dir target
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
    cp -r target/locale "$pkgdir/usr/share/"
}
