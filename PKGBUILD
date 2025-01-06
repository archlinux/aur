# Maintainer: LJ

pkgname=gupaxx-git
_name=gupaxx
pkgver=1.7.1
pkgrel=1
pkgdesc="GUI Uniting P2Pool And XMRig "
arch=('x86_64')
url="https://github.com/Cyrix126/gupaxx"
license=('GPL-3.0')
optdepends=('xmrig' 'xmrig-proxy' 'monero' 'p2pool')
makedepends=('cargo' 'rustup' 'git' 'mold')
#source=("git+$url#tag=v$pkgver" gupaxx.desktop)
source=("git+$url" gupaxx.desktop)
b2sums=(
    'SKIP'
    '404d394d1e46411eabe9be5f12009829309292033055abfad8296790f568ab962cf1ea26f653563b28c4833912723d444851dca6b281fd95943d65d9688a13ec'
)

build() {
    cd $_name
    cargo build --release --features distro
}

package() {
    install -Dm755 "$_name/target/release/$_name" "$pkgdir/usr/bin/$_name"

    # Icons
    install -Dm644 "$_name/assets/images/icons/icon.ico" "$pkgdir/usr/share/$_name/icon.ico"
    install -Dm644 "$_name/assets/images/icons/icon.png" "$pkgdir/usr/share/$_name/icon.png"
    install -Dm644 "$_name/assets/images/icons/icon@2x.png" "$pkgdir/usr/share/$_name/icon@2x.png"

    # Desktop entry
    install -Dm644 $_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"
}
