# Maintainer: Anton Reshetov

pkgname=masscode
pkgver=3.5.0
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers "
arch=("x86_64")
url="https://github.com/massCodeIO/massCode"
license=("AGPL-3.0")
depends=(electron)
makedepends=(squashfs-tools)
source=("https://github.com/massCodeIO/massCode/releases/download/v${pkgver}/masscode_${pkgver}_amd64.snap"
"masscode.png::https://raw.githubusercontent.com/massCodeIO/massCode/master/config/icons/256x256.png"
    "masscode.desktop"
)
sha256sums=('f7dde1215c6a58b0d2ec4752814371e6814c40cf2d66b15fd43f7e4abcebd483'
            '6e54dbd534b364727ca2514e21a49742a939c454867f46da113bba2c3d2777ec'
            'a2e9a02993e1b8efc74fbee597219a84eeb776d41d1dcf0ae9742c2d9fcb9f15')

build() {
    unsquashfs "masscode_${pkgver}_amd64.snap"
}

package() {
    install -d "$pkgdir/opt/masscode"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/icons"
    install -d "$pkgdir/usr/share/applications"

    cp masscode.png "$pkgdir/usr/share/icons"
    echo "#!/bin/env bash
NODE_ENV='' electron /opt/masscode/app.asar" >> "$pkgdir/usr/bin/masscode"
    chmod +x "$pkgdir/usr/bin/masscode"
    cp masscode.desktop "$pkgdir/usr/share/applications"
    cd squashfs-root
    cp resources/app.asar "$pkgdir/opt/masscode"
}
