# Maintainer: aquova <mail at aquova dot net>

pkgname=zelda64recomp-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Static recompilation of Majora's Mask for PC"
url='https://github.com/Mr-Wiseguy/Zelda64Recomp'
arch=("x86_64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
source=(
    "${url}/releases/download/v${pkgver}/Zelda64Recompiled-v${pkgver}-Linux-x64.tar.gz"
)
sha256sums=(
    '62857ea68858554ec7ec4c461ebf5fba11142016684b4fea0804979e644493cb'
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
