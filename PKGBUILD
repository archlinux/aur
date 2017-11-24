# Maintainer: Eden Rose < eenov1988 (AT) gmail (D.O.T) com >

pkgname=vlc-youtube
pkgver=20171124
pkgrel=1
pkgdesc='ARC Dark skin for VLC Media Player (git version)'
url='https://github.com/videolan/vlc'
arch=('any')
license=('GPL')
depends=('vlc')
makedepends=('git' 'make' 'sudo')
options=('!strip')
source=("https://github.com/videolan/vlc/raw/master/share/lua/playlist/youtube.lua"
".install")
sha256sums=('SKIP'
'5b50fbd4bef26a5510a0810580a1e9f44c1ac4aa5c126b391bb8d66e6ed44fc0')

pkgver() {
    cd ${srcdir}
    if [ -d vlc ]; then
    sudo rm -r vlc
    fi
    git clone --bare --depth=1 https://github.com/videolan/vlc.git vlc
    cd vlc
    git log -1 --format="%cd" --date=short -- share/lua/playlist/youtube.lua | tr -d '-'
}

package() {
    cd ${pkgdir}
    mkdir -p usr/share/vlc/lua/playlist/
    cp ${srcdir}/youtube.lua  ${pkgdir}/usr/share/vlc/lua/playlist/youtube.luac
}
