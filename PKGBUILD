# Maintainer: srgooglo <srgooglo@ragestudio.net>
pkgname=comty-desktop-bin

_electronversion=45

pkgver="0.13.0"
pkgrel=1
pkgdesc="Official Comty Desktop application bin"
arch=("x86_64")
url="https://github.com/ragestudio/comty"
license=("MIT")

depends=("electron$_electronversion")
source=(
    "comty.sh"
    "comty-desktop.desktop"
    "https://github.com/ragestudio/comty/releases/download/desktop-v${pkgver}/comty-desktop_${pkgver}_amd64.deb"
)
sha256sums=(
    "02f24b7cd9558d0d308c3eb5fadb892faffc838162b536a0a713e02cf0c5f363"
    "a47c8763f0a4a354ac724ab9c067508f07495ed543568f99f8a36ba33bd35a5d"
    "33bdbcf3831445304c69081997daf121ea7cf77148a406b792b8fca46659d4d9"
)

prepare() {
    mkdir -p data
    tar xfC data.tar.xz data

   	sed -i "s/{ver}/$_electronversion/" comty.sh
}

package() {
    install -Dm644 data/opt/Comty/resources/app.asar "$pkgdir/usr/lib/comty/app.asar"
	install -Dm755 comty.sh "$pkgdir/usr/bin/comty"

    install -Dm644 data/usr/share/icons/hicolor/512x512/apps/comty-desktop.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/comty.png"
	install -Dm644 comty-desktop.desktop "$pkgdir/usr/share/applications/comty-desktop.desktop"
}
