# Maintainer: aquova <mail at aquova dot net>

pkgname=zelda64recomp-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Static recompilation of Majora's Mask for PC"
url='https://github.com/Mr-Wiseguy/Zelda64Recomp'
arch=("x86_64")
license=("GPL3")
source=(
    "${url}/releases/download/v${pkgver}/Zelda64Recompiled-v${pkgver}-Linux.tar.gz"
)
sha256sums=(
    'f13d8d1250735bc4fae2a7c9a4365e28bc75239cffb51ce160d91a1aac6dbb87'
)

package() {
    mkdir -p $pkgdir/usr/bin

    install -Dm755 $srcdir/Zelda64Recompiled $pkgdir/opt/$pkgname/${pkgname%-bin}
    install -Dm644 ../zelda64recomp.desktop -t $pkgdir/usr/share/applications/
    cp -r --preserve=mode $srcdir/assets $pkgdir/opt/$pkgname
    install -Dm644 $srcdir/assets/mm-clipped.svg $pkgdir/usr/share/pixmaps/${pkgname%-bin}.svg

    echo "#!/usr/bin/env bash
    cd /opt/${pkgname}
    ./${pkgname%-bin}" > $pkgname.sh
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/${pkgname%-bin}
}
