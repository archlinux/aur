# Maintainer: srgooglo <srgooglo@ragestudio.net>
pkgname=comty-desktop-bin

_electronversion=43

pkgver="0.12.0"
pkgrel=1
pkgdesc="Official Comty Desktop application bin"
arch=("x86_64")
url="https://github.com/ragestudio/comty"
license=("MIT")

depends=("electron$_electronversion")
source=(
    "comty.sh"
    "comty-desktop.desktop"
    "https://b2-cdn.ragestudio.net/file/rs-static/comty-desktop/releases/linux/comty-desktop_${pkgver}_amd64.deb"
)
sha256sums=(
    "02f24b7cd9558d0d308c3eb5fadb892faffc838162b536a0a713e02cf0c5f363"
    "a47c8763f0a4a354ac724ab9c067508f07495ed543568f99f8a36ba33bd35a5d"
    "c389d543f06365b3c9dc1c31a01aaa201c085843e317f26e5cd2ff0be5d38154"
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
