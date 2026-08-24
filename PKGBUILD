# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=smb1r-bin
_pkgver=1.1-rc5
pkgver="${_pkgver//[.-]/_}"
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
    '4c543b643115b5252ca65089614019b6b387b723c4fbe05261340e1b7a7c8c49'
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
