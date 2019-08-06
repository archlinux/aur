# Maintainer: Radoslaw Mejer <radmen@radmen.info>
pkgname=silicon
pkgver=0.2.5
_relcommit='13209ffd5fdb7fe6c150060ba0a6e7c3d9faa5c8'
pkgrel=4
depends=('fontconfig' 'freetype2' 'xclip')
makedepends=('rust' 'cargo' 'glibc' 'llvm-libs' 'gcc-libs')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Create beautiful image of your code"
license=('MIT')
source=(
    "silicon-$pkgver.zip::https://github.com/Aloxaf/silicon/archive/$_relcommit.zip"
    "https://raw.githubusercontent.com/Aloxaf/silicon/master/LICENSE"
    "0001-font-kit.patch"
)
sha256sums=(
    'c1cb9d6e7e3bd354f1e02915ffb012beffa1637b395387b139eaaf7dbb83d1bc'
    '87d7aaf6d61cd4bea70acd5bf7015cd115e821b68f9918d10a59a6d0cd4066b2'
    'ef8225eb6c7d14648ed1a769f5b7177593bde16f5ab9ce75cbcc92df79b6639a'
)

build() {
    return 0
}

package() {
    patch -d "$srcdir/silicon-$_relcommit" -p1 < "0001-font-kit.patch"
    cargo install --root="$pkgdir/usr" --path "$srcdir/silicon-$_relcommit"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -f "$pkgdir/usr/.crates.toml"
}
