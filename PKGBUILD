pkgname="techmino-git"
pkgver=0.17.6.c2f1e9d
pkgrel=1
pkgdesc="A collection of various modern block game rules, more ways to play, and awesome features added for a new experience."
arch=('x86_64')
url="https://github.com/26F-Studio/Techmino"
license=('LGPL3')
depends=('love')
options=(!strip)
makedepends=('git' 'p7zip')
conflicts=('techmino-client')
provides=('techmino-client')
source=("git+https://github.com/26F-Studio/Techmino.git"
        "git+https://github.com/26F-Studio/Zframework.git"
        "CC_Linux.zip::https://github.com/26F-Studio/cold_clear_ai_love2d_wrapper/releases/download/11.4/Linux.zip"
        "Techmino.desktop")
sha256sums=('SKIP'
            'SKIP'
            '51b329331a978d592033feec9dbdc9acfcf5bd89ae1b9bfe33b6b00033ddf913'
            '8db2bf0e696c7a11883d735876f0ec81d9abd1596ead3db0eb041ee4a1941db2')

prepare() {
	cd ${srcdir}/Techmino
    git submodule init
    git config Zframework.url "$srcdir/Zframework"
    git submodule update
    7z a -tzip ../Techmino.love media parts Zframework conf.lua main.lua version.lua
    cd ..
    cp ./Techmino/.github/build/linux/dev/icon.png ./Techmino.png

    7z x -y CC_Linux.zip
}

package() {
    install -Dm644 "Techmino.love" "${pkgdir}/opt/Techmino/Techmino.love"
    install -Dm644 "./x64/CCloader.so" "${pkgdir}/opt/Techmino/CCloader.so"
    install -Dm644 "./x64/libcold_clear.so" "${pkgdir}/opt/Techmino/build/x64/libcold_clear.so"
    install -Dm644 "Techmino.png" "${pkgdir}/opt/Techmino/Techmino.png"
    install -Dm644 "Techmino.desktop" "${pkgdir}/usr/share/applications/Techmino.desktop"
}