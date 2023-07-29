# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
pkgname=tundra
pkgver=0.4.1
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
conflicts=('tundra-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/m4tx/$pkgname/archive/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/erengy/anime-relations/d0af426fa3e18d54d55f90c25ecfb96960394406/anime-relations.txt")
noextract=()
md5sums=('f57efcc0e4ebcfe385a0fec15357f922'
         '712fbe4ccca3db0fd5346db526bd7e59')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    cp "$srcdir/anime-relations.txt" "vendor/anime-relations/"
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
