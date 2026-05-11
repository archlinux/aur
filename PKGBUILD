# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=smb1r-bin
pkgver=1.1.26w19a
_pkgver=1.1-26w19a
pkgrel=1
pkgdesc='Super Mario Bros. Remastered'
url='https://github.com/JHDev2006/Super-Mario-Bros.-Remastered-Public'
arch=("x86_64")
license=("GPLv3")
depends=()
source=(
    "$url/releases/download/$_pkgver/Linux.zip"
    "smb1r.desktop"
)
sha256sums=(
    '8e88ef8c75a5d551ed3b1f04d20fd0da3368893c697c6fbb9dac1214201811af'
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
