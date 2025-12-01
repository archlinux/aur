# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=smb1r-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Super Mario Bros. Remastered'
url='https://github.com/JHDev2006/Super-Mario-Bros.-Remastered-Public'
arch=("x86_64")
license=("GPLv3")
depends=()
source=(
    "$url/releases/download/$pkgver/Linux.zip"
    "smb1r.desktop"
)
sha256sums=(
    'a94128b28187095a32c586b754fb86c00267bd424534419dd0179ef7c8701fbd'
    'c63c4b0cf5e2775f75bfd0d4c2526cc4666eece80380da8c134be2a570aa51af'
)

package() {
    mkdir -p $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/share/applications
    cd $srcdir
    install -Dm755 SMB1R.x86_64 $pkgdir/opt/$pkgname
    install -Dm644 libdiscord_game_sdk.so $pkgdir/opt/$pkgname
    install -Dm644 libdiscord_game_sdk_binding.so $pkgdir/opt/$pkgname
    install -Dm644 libgodotgif.linux.template_release.x86_64.so $pkgdir/opt/$pkgname
    install -Dm644 SMB1R.pck $pkgdir/opt/$pkgname
    install -Dm644 smb1r.desktop $pkgdir/usr/share/applications

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./SMB1R.x86_64" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/smb1r
}
