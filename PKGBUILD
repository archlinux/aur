# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
pkgname=tundra-git
pkgver=0.3.0.014070
pkgrel=1
epoch=
pkgdesc="MyAnimeList scrobbler (git version)"
arch=('x86_64')
url="https://tundra.moe"
license=('GPL3')
groups=()
depends=('gtk4' 'libadwaita' 'dbus')
makedepends=('rust' 'git')
checkdepends=()
optdepends=()
provides=('tundra')
conflicts=('tundra')
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/m4tx/tundra"
        "https://raw.githubusercontent.com/erengy/anime-relations/master/anime-relations.txt")
noextract=()
md5sums=('SKIP'
         'SKIP')
validpgpkeys=()

prepare() {
    cd "tundra"
    cp "$srcdir/anime-relations.txt" "vendor/anime-relations/"
}

build() {
    cd "tundra"
    cargo build --release --locked --all-features
}

check() {
    return 0
}

package() {
    cd "tundra"
    install -Dm 755 target/release/tundra -t "${pkgdir}/usr/bin"
    install -Dm 755 data/moe.tundra.Tundra.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm 755 data/moe.tundra.Tundra.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r target/locale "$pkgdir/usr/share/"
}
