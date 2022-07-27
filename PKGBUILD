# Maintainer: Misha <mishakmak at gmail dot com>

pkgname=colab-desktop
pkgver=1.0
pkgrel=2
pkgdesc="Google Colab desktop webapp wrapper"
arch=('any')
url="https://colab.research.google.com/"
license=('MIT')
depends=('electron')
makedepends=('npm' 'icoutils')
replaces=('colab-chromium-desktop')
source=('build.js' 'colab-desktop' 'GoogleColab.desktop' 'https://colab.research.google.com/img/favicon.ico')
sha256sums=('8a248e77ef7a0a6058d45a3b3c3b2e02ae563332d313fbaae2da8e4baf21f33f'
            'f72bd81379a65d7825fc7a2c5cef141330380b16b1fd3dceefcc50dde812c7f7'
            '7c5cd5852cc603e45a99cf2e9787a150ec8717b0477ea8d57daa5193a0b79a53'
            '52232ddc81832d3edc91776ac1bc587fc40c91dc633e00b5f911466ad1c67f3a')

build() {
    cd "$srcdir"
    sed -i "s/SYS_ELECTRON_VERS/$(tail /usr/lib/electron/version)/" build.js
    icotool -x favicon.ico
    cp favicon_1_128x128x32.png googlecolab.png
    npm install nativefier
    node build.js
}

package() {
    cd "$srcdir"
    install -Dm644 GoogleColab-linux-*/resources/app.asar -t "$pkgdir/usr/share/colab-desktop/"
    install -Dm755 "colab-desktop" -t "$pkgdir/usr/bin/"
    install -Dm644 "GoogleColab.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "favicon_1_128x128x32.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/googlecolab.png"
    install -Dm644 "favicon_2_32x32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/googlecolab.png"
    install -Dm644 "favicon_3_16x16x32.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/googlecolab.png"
}
