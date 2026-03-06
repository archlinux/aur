# Maintainer: Ananas <ananas[at]ananas.moe>

pkgname=gram-bin
pkgver="1.0.0"
pkgrel=1
pkgdesc="The Gram Code Editor"
url="https://codeberg.org/GramEditor/gram"
license=(GPL-3.0-or-later AGPL-3.0-or-later Apache-2.0)
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support')
provides=("gram")
conflicts=("gram")
arch=("x86_64")
source=(
    "$pkgname-$pkgver.tar.gz::https://codeberg.org/GramEditor/gram/releases/download/$pkgver/gram-linux-x86_64-$pkgver.tar.gz"
    "gram.sh"
)

sha256sums=('12b945739396312d9af27b1866d5b05ac6caf78415027798f5a68c1282bec331'
            '65844d78ba9e000a63f39f9f4f2c3d20a2383c6e802d2ae37555db1a10562fd7')

_pkgname=gram

package() {
    install -dm755 $pkgdir/opt/$_pkgname

    cd $srcdir/gram.app

    mv bin lib libexec $pkgdir/opt/$_pkgname

    install -Dm755 ../$_pkgname.sh "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 licenses.md "$pkgdir/usr/share/licenses/$pkgname/licenses.md"
    install -Dm644 share/applications/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 share/icons/hicolor/512x512/apps/$_pkgname.png "$pkgdir/usr/share/icons/$_pkgname.png"
}
