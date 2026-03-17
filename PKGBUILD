# Maintainer: LuoTianyi_arm64 <2153585992@qq.com>
options=(!strip !debug)
pkgname=astraeditor-bin
provides=('astraeditor')
conflicts=('astraeditor')
pkgver=1.1.4
pkgrel=1
pkgdesc='AstraEditor is a TurboWarp mod used to add more practical features to make your writing lightning fast.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/AstraEditor/'
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'nss' 'libxss' 'xdg-utils' 'hicolor-icon-theme')
source_x86_64=("astraeditor-${pkgver}-x86_64.deb::https://github.com/AstraEditor/Desktop/releases/download/v1.1.4/AstraEditor-linux-amd64-${pkgver}.deb")
source_armv7h=("astraeditor-${pkgver}-armv7h.deb::https://github.com/AstraEditor/Desktop/releases/download/v1.1.4/AstraEditor-linux-armv7l-${pkgver}.deb")
source_aarch64=("astraeditor-${pkgver}-aarch64.deb::https://github.com/AstraEditor/Desktop/releases/download/v1.1.4/AstraEditor-linux-aarch64-${pkgver}.deb")
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')

build() {
    cd "$srcdir"

    case "$CARCH" in
        x86_64)  debfile="astraeditor-${pkgver}-x86_64.deb" ;;
        aarch64) debfile="astraeditor-${pkgver}-aarch64.deb" ;;
        armv7h)  debfile="astraeditor-${pkgver}-armv7h.deb" ;;
    esac
    bsdtar -xf "$debfile"
    bsdtar -xf data.tar.xz
}

package() {
    cp -r "$srcdir/opt" "$pkgdir"
    cp -r "$srcdir/usr" "$pkgdir"
    if [ ! -L "$pkgdir/usr/bin/astraeditor-desktop" ]; then
        install -d "$pkgdir/usr/bin"
        ln -sf '/opt/AstraEditor/astraeditor-desktop' "$pkgdir/usr/bin/astraeditor-desktop"
    fi
}
