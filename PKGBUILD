# Maintainer: Horace Liu <im.liuhq@gmail.com>

pkgname=moyurd
pkgver=1.1.0
pkgrel=1
pkgdesc="A keyboard-driven and simple Epub reader"
arch=('x86_64')
url="https://github.com/liuhq/moyurd"
license=('MIT')
_electron=electron38
depends=("$_electron")
source=("$url/releases/download/v$pkgver/moyurd-asar-linux-x64-$pkgver.zip"
    "$pkgname.desktop"
    "LICENSE-SOURCE")
sha256sums=('c458feb27f2c002bc4f7b0efa1615d24af4d0be5403b6c4974ffd15ec3c5ce8c'
    '99aacf06b241b0ec014bf3bd290818c2d554ecc476c7a96715ac9f4b681dd4e5'
    'ae584eda9b8f341e819d7b3ffb1be88babe63cfdb6fc16293f10ad0fe0853645')

package() {
    install -Dm644 -t "$pkgdir/usr/lib/$pkgname/resources" \
        "resources/app.asar"

    install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#! /bin/sh
exec $_electron /usr/lib/$pkgname/resources/app.asar --no-sandbox "\$@"
EOF

    install -Dm644 "$srcdir/resources/icon.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    install -Dm644 -t "$pkgdir/usr/share/applications" \
        "$srcdir/$pkgname.desktop"

    install -Dm644 "$srcdir/LICENSE-SOURCE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
