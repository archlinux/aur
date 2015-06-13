# Maintainer: ZaphodBeeblebr0x <mattmoore at carbonhelix dot com>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: haagch <haagch@studi.informatik.uni-stuttgart.de>

pkgname=ut4
pkgver=2566237
pkgrel=1
pkgdesc="PRE-ALPHA of the new Unreal Tournament based on Unreal Engine 4. Registration at the forum required. Download zip file and put it in the directory with the PKGBUILD"
arch=("x86_64")
url="https://forums.unrealtournament.com/showthread.php?12011-Unreal-Tournament-Pre-Alpha-Playable-Build"
DLAGENTS+=('file::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", from https://forums.unrealtournament.com/showthread.php?12011-Unreal-Tournament-Pre-Alpha-Playable-Build. Registration required."; exit 1')
license=('custom')
depends=()
makedepends=("unzip")
options=()
source=("https://s3.amazonaws.com/unrealtournament/UnrealTournament-Client-XAN-${pkgver}-Linux.zip"
        "UnrealTournament"
        "UnrealTournament4.desktop")
noextract=(https://s3.amazonaws.com/unrealtournament/UnrealTournament-Client-XAN-${pkgver}-Linux.zip)
md5sums=('8f93f5704d5824d3966420c8d40073cb'
         'c75648bafa54d1ed3c166a87a114deb7'
         '126d209e58c0dd01bc3151b175651105')

_root=LinuxNoEditor

prepare() {
    cd $srcdir
    unzip UnrealTournament-Client-XAN-${pkgver}-Linux.zip
}

package() {
    install -d "$pkgdir/opt"
    cp -ra $_root "$pkgdir/opt/ut4"

    chgrp -R games "$pkgdir/opt/ut4"
    chmod -R a+rw "$pkgdir/opt/ut4/UnrealTournament/Saved"

    chmod +x "$pkgdir/opt/ut4/Engine/Binaries/Linux/UE4-Linux-Test"

    install -d "$pkgdir/usr/bin"
    install UnrealTournament "$pkgdir/usr/bin/UnrealTournament"
    chmod +x "$pkgdir/usr/bin/UnrealTournament"

    install -d "$pkgdir/usr/share/icons/"

    install -d "$pkgdir/usr/share/applications/"
    install UnrealTournament4.desktop "$pkgdir/usr/share/applications/"
}
