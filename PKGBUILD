# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
pkgname=tundra
pkgver=0.5.4
pkgrel=3
epoch=
pkgdesc="MyAnimeList scrobbler"
arch=('x86_64')
url="https://tundra.moe"
license=('GPL-3.0-only')
groups=()
depends=('gtk4' 'libadwaita' 'dbus' 'hicolor-icon-theme')
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug !lto)
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/m4tx/$pkgname/archive/v$pkgver.tar.gz"
        "anime-relations-$pkgver.txt::https://raw.githubusercontent.com/erengy/anime-relations/e7e26e3e234cab8e8e45a1fb201bd3a599897cc3/anime-relations.txt")
noextract=()
md5sums=('a0e506ddec3d62473fa42e7b54b424cc'
         '0cbde2a6f270098ed63e7c6a7c9a6465')
sha256sums=('a75148db97ef0182390cd6bd74c2d52167fb27aea1ca48818cfa5c0c3c72cf56'
            '40f48d53e1f705ded033daa2eb88114358046755d4650520dfed65e683925003')
b2sums=('12f3255313e0baa6a67dd1e12015304d1b04c9cac6309312e4498566ab94c6fdc6230958d9b144695d7519d893b90a44834aed0ea08e22aeb4f8baccf2732f40'
        '977193d815fe473015658b69923c9c5472983277aa353bfe576a6d5aaba9657a5519b1c15a13e36fe2d2244644f0b0f33727aebafca4b2d050f57bae5105b20a')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver" || exit
    cp "$srcdir/anime-relations-$pkgver.txt" "vendor/anime-relations/anime-relations.txt"
}

build() {
    cd "$pkgname-$pkgver" || exit
    cargo build --release --locked --all-features --target-dir target
}

check() {
    return 0
}

package() {
    cd "$pkgname-$pkgver" || exit
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    install -Dm 755 data/moe.tundra.Tundra.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm 755 data/moe.tundra.Tundra.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r target/locale "$pkgdir/usr/share/"
}
