pkgname="techmino-git"
pkgver=0.17.6.r4468.76d985cc
pkgrel=1
pkgdesc="A collection of various modern block game rules, more ways to play, and awesome features added for a new experience."
arch=('x86_64')
url="https://github.com/26F-Studio/Techmino"
license=('LGPL3')
depends=('love')
options=(!strip)
makedepends=('git' 'zip')
source=("git+https://github.com/26F-Studio/Techmino.git"
        "git+https://github.com/26F-Studio/Zframework.git"
        "CC_Linux.zip::https://github.com/26F-Studio/cold_clear_ai_love2d_wrapper/releases/download/11.4/Linux.zip"
        "Techmino_Development.desktop")
sha256sums=('SKIP'
            'SKIP'
            '51b329331a978d592033feec9dbdc9acfcf5bd89ae1b9bfe33b6b00033ddf913'
            '505e1a4fdc75a5726b620fd0429937d88023c7af19aadd9a730f687739360a3c')

prepare() {
	cd ${srcdir}/Techmino
    git submodule init
    git config Zframework.url "$srcdir/Zframework"
    git submodule update
    zip -r1 ../game.love media parts Zframework conf.lua main.lua version.lua
    cd ..
    cp ./Techmino/.github/build/linux/dev/icon.png ./Techmino_Development.png

    bsdtar -xf CC_Linux.zip
}

package() {
    install -Dm644 "game.love" "${pkgdir}/opt/Techmino_Development/game.love"
    install -Dm644 "./x64/CCloader.so" "${pkgdir}/opt/Techmino_Development/CCloader.so"
    install -Dm644 "./x64/libcold_clear.so" "${pkgdir}/opt/Techmino_Development/build/x64/libcold_clear.so"
    install -Dm644 "Techmino_Development.png" "${pkgdir}/usr/share/icons/Techmino_Development.png"
    install -Dm644 "Techmino_Development.desktop" "${pkgdir}/usr/share/applications/Techmino_Development.desktop"
}
