# Maintainer: n0vella <n0vella@outlook.com>
# This PKGBUILD compiles and installs the latest tag of the git repository
pkgname=cardo
pkgver=1.12.0
pkgrel=1
pkgdesc="A graphical podcast client"
arch=('x86_64')
url="https://github.com/cardo-podcast/cardo/"
license=('GPL-3.0-or-later')
groups=()
depends=('gtk3' 'webkit2gtk' 'sqlite')
makedepends=('git' 'cargo' 'pnpm' 'nodejs')
options=('!lto') # https://github.com/toeverything/AFFiNE/issues/6280#issuecomment-2041484627
source=("https://github.com/cardo-podcast/cardo/archive/refs/tags/$pkgver.tar.gz" 'cardo.desktop')
sha256sums=('3062591d2ac6db79222eeff07663901e1a66456458d8ed829e8296b599fb8cfd'
            '9d9b2d1bb6643f5940085e9df3f7853203f4b70a3ac1a94972284f565849f62b')



build() {
	cd "$srcdir/$pkgname-$pkgver"
    pnpm install --frozen-lockfile
	pnpm run tauri build -b none
}


package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm644 $srcdir/cardo.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 icon.png "$pkgdir/usr/share/icons/$pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
