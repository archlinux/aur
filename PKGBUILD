# Maintainer: Maciej Dems <macdems@gmail.com>
pkgname=unmined-gui
pkgver="0.19.23"
pkgrel=1
pkgdesc="An easy to use and fast Minecraft world viewer and mapper tool"
arch=('x86_64')
url="https://unmined.net/"
depends=()
builddepends=('zstd')
license=('custom')
source=("unmined-gui_${pkgver}-dev_amd64.deb::https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/?tmstv=1703272693")
sha256sums=('8ed8dfd572d27b3276e439345a6b1ad58ae42d9ea654eac313a7bac9957291cc')
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
