# Maintainer: Yakov Till <yakov.till at gmail dot com>
# Contributor: Maciej Dems <macdems@gmail.com>
pkgname=unmined-gui
pkgver="0.19.46"
pkgrel=1
pkgdesc="An easy to use and fast Minecraft world viewer and mapper tool"
arch=('x86_64')
url="https://unmined.net/"
depends=()
builddepends=('zstd')
license=('custom')
source=("unmined-gui_${pkgver}-dev_amd64.deb::https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/?tmstv=1738874199")
sha256sums=('ed75131ceb5fa2cd25ac1fcd8c7641086a5b629c060ea43d09033143c242845b')
options=(!strip)

prepare() {
    mkdir -p "$srcdir/unmined-gui_${pkgver}-dev"
    cd "$srcdir/unmined-gui_${pkgver}-dev"
    tar --use-compress-program=unzstd -xf "$srcdir/data.tar.zst"
}


package() {
    cd "$srcdir/unmined-gui_${pkgver}-dev"
    cp -a usr opt "$pkgdir/"
    chmod +x "$pkgdir/opt/unmined/unmined"
    install -D -m644 opt/unmined/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
