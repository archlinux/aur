# Maintainer: aquova <austinbricker at protonmail dot com>

pkgname=dreampotato-bin
_pkgname=DreamPotato
pkgver=0.2.0
pkgrel=1
pkgdesc='An emulator for the Dreamcast VMU'
url='https://github.com/RikkiGibson/DreamPotato'
arch=("x86_64")
license=("MIT")
depends=()
source=(
    "$url/releases/download/v$pkgver/DreamPotato-Linux-x64-v$pkgver.zip"
    "dreampotato.desktop"
)
sha256sums=(
    'b7ca4a3a821cfb6b252db4bbfc74a2b06de39a85a809210e0dc74e70462e65dc'
    '274b696ef5ee780082ff5e0e3743aee11e8ea4d14a2c4abea491b68c0c4ce1bd'
)
provides=("dreampotato")
options=("!strip")

package() {
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/opt/$pkgname
    cd $srcdir
    install -Dm755 DreamPotato $pkgdir/opt/$pkgname
    install -Dm644 *.so $pkgdir/opt/$pkgname
    install -Dm644 *.so.0 $pkgdir/opt/$pkgname
    install -Dm644 *.pdb $pkgdir/opt/$pkgname

    install -dm777 $pkgdir/opt/$pkgname/Content
    install -dm777 $pkgdir/opt/$pkgname/Data
    cp -r Content/* $pkgdir/opt/$pkgname/Content
    cp -r Data/* $pkgdir/opt/$pkgname/Data

    install -Dm644 dreampotato.desktop $pkgdir/usr/share/applications

    echo "#!/usr/bin/env bash
    cd /opt/$pkgname
    ./$_pkgname" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/$_pkgname
}
