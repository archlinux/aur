# Maintainer: Federico Maria Morrone <aur at morrone dot dev>

pkgname=gupax
pkgver=1.3.9
pkgrel=1
pkgdesc="GUI Uniting P2Pool And XMRig "
arch=('x86_64')
url="https://github.com/hinto-janai/gupax"
license=('GPL-3.0')
depends=('p2pool' 'xmrig')
makedepends=('cargo')
source=("git+$url#tag=v$pkgver" gupax.desktop)
b2sums=(
    'SKIP'
    'd2f13b48123ec84a09aff523baf49a74434c839b88c3f2dbf0841f820194a301d4ffe4569eaff427c2880029fc0a76e4362c0066f2047f31a2dbdf3be96fd369'
)

build() {
    cd $pkgname
    cargo build --release --features distro
}

package() {
    install -Dm755 "$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Icons
    install -Dm644 "$pkgname/images/icons/icon.ico" "$pkgdir/usr/share/$pkgname/icon.ico"
    install -Dm644 "$pkgname/images/icons/icon.png" "$pkgdir/usr/share/$pkgname/icon.png"
    install -Dm644 "$pkgname/images/icons/icon@2x.png" "$pkgdir/usr/share/$pkgname/icon@2x.png"

    # Desktop entry
    install -Dm644 gupax.desktop "$pkgdir/usr/share/applications/gupax.desktop"
}
