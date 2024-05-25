# Maintainer: Lauri Gustafsson <lauri at gustafla dot space>

pkgname=rocket-git
pkgver=r843.59be1f1
pkgrel=1
pkgdesc="Sync-tracker library and editor for realtime audiovisual productions"
arch=("i686" "x86_64" "armv7l" "aarch64")
url="https://github.com/rocket/rocket"
license=("Zlib")
depends=("qt6-base" "qt6-websockets" "hicolor-icon-theme" "glibc" "gcc-libs")
makedepends=("git")
source=(
    "rocket::git+https://github.com/rocket/rocket"
    "rocket.desktop"
    "rocket.png"
)
noextract=("rocket.desktop" "rocket.png")
sha256sums=(
    "SKIP"
    "7247d9d2a4bf8f7861f6d4891c7dc14be017dda1becf9ec7b7f8906ab5577651"
    "6d563e2de36d58568c4266a98053b16490c01f2a9e1dc353b93e58a521cde8c9"
)

pkgver() {
    cd rocket
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

#prepare() {
#}

build() {
    cd rocket
    make QMAKE=qmake6
}

#check() {
#}

package() {
    install -d "${pkgdir}/usr/lib/rocket"
    install -d "${pkgdir}/usr/include/rocket"
    cp rocket/lib/*.a "${pkgdir}/usr/lib"
    cp rocket/lib/*.c "${pkgdir}/usr/lib/rocket"
    cp rocket/lib/*.h "${pkgdir}/usr/lib/rocket"
    cp rocket/lib/sync.h "${pkgdir}/usr/include/rocket"
    install -Dm755 rocket/editor/editor "${pkgdir}/usr/bin/rocket"
    install -Dm644 rocket.desktop "${pkgdir}/usr/share/applications/rocket.desktop"
    install -Dm644 rocket.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/rocket.png"
}

