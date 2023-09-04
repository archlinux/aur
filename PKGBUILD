# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
pkgname=tundra
pkgver=0.4.2
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
md5sums=('819b2932851bda274ee419fc24e03241'
         'b920d517cd5026ff02207bd874bca756')
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
