# Maintainer: srgooglo <srgooglo@ragestudio.net>
pkgname=comty-desktop

_electronversion=38

pkgver="0.4.0"
pkgrel=1
pkgdesc="Official Comty Desktop application"
arch=("x86_64")
url="https://github.com/ragestudio/comty"
license=("MIT")

conflicts=(
    "comty-desktop-bin"
)
makedepends=(
    "nodejs"
)
depends=(
    "electron$_electronversion"
)
source=(
    "comty.sh"
    "comty.desktop"
    "https://github.com/ragestudio/comty/archive/refs/heads/master.tar.gz"
)
sha256sums=(
    "SKIP"
    "SKIP"
    "SKIP"
)

prepare() {
    sed -i "s/{ver}/$_electronversion/" comty.sh
}

build() {
    cd "$srcdir"
    tar xf master.tar.gz

    cd "$srcdir/comty-master/packages/desktop"

    npm install -y
    npx electron-builder --dir --publish never
}

package() {
 echo "me cago"

 install -Dm644 "$srcdir/comty-master/packages/desktop/dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/comty/app.asar"
 install -Dm755 comty.sh "$pkgdir/usr/bin/comty"

 install -Dm644 "$srcdir/comty-master/packages/desktop/resources/icon-512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/comty.png"
 install -Dm644 comty.desktop "$pkgdir/usr/share/applications/comty.desktop"
}
