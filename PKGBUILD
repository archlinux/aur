# Maintainer: Ananas <ananas[at]ananas.moe>

pkgname=gram-bin
pkgver="1.2.1"
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

sha256sums=('28d1623a32c8d99fe494754eb1aa7b34d66904e79bc19a7fa2ec772c3abaf45f'
            '65844d78ba9e000a63f39f9f4f2c3d20a2383c6e802d2ae37555db1a10562fd7')

_pkgname=gram

package() {
    install -dm755 $pkgdir/opt/$_pkgname

    cd $srcdir/gram.app

    mv lib libexec bin "$pkgdir/opt/$_pkgname"

    install -Dm755 ../$_pkgname.sh "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 licenses.md "$pkgdir/usr/share/licenses/$pkgname/licenses.md"
    install -Dm644 share/applications/$_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"

    install -Dm644 share/icons/hicolor/scalable/apps/app.liten.Gram.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/app.liten.Gram.svg"
    install -Dm644 share/icons/hicolor/symbolic/apps/app.liten.Gram-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/app.liten.Gram-symbolic.svg"
}
