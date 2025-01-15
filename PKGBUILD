pkgname=planetblupi-bin
pkgver=1.15.0
pkgrel=2
pkgdesc="Planet Blupi game"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/planetblupi/"
license=('GPL3')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_ttf' 'libpng' 'libogg' 'ffmpeg' 'libvorbis')
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums=('176cc1107f67ae085e0d6b7ad93c0696c6b7680d6e3aea4cc73b7d3279271b9c')
sha256sums_x86_64=('8ad05d22a8fc5fe39ed1fc00e70a86c39fefcd1f15e92847733dbca4feb8ea67')
sha256sums_aarch64=('82054e5fcc80b3ad6c25ad4e05d5be4b1b5c810ac0a8e044c484e3109ba5df81')
source=("planetblupi.desktop")                    
source_x86_64=("https://gitlab.com/linuxbombay/planetblupi/binaries/$pkgver/-/raw/main/planetblupi-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/planetblupi/binaries/$pkgver/-/raw/main/planetblupi-linux-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/share/planetblupi"
    install -dm755 "$pkgdir/usr/lib"
    install -dm644 "$pkgdir/usr/share/icons"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/bin"
    
    #Lib fix only applies for Arm64
    if [ ! -e /usr/lib/libjxl.so.0.10 ]; then
      ln -s /usr/lib/libjxl.so $pkgdir/usr/lib/libjxl.so.0.10
    fi
    cp -r "$srcdir/planetblupi/share/planetblupi" "$pkgdir/usr/share"
    cp -r "$srcdir/planetblupi/share/icons/hicolor" "$pkgdir/usr/share/icons"
    install -Dm755 "planetblupi.desktop" "$pkgdir/usr/share/applications"
    cp -r "$srcdir/planetblupi/bin/planetblupi" "$pkgdir/usr/bin"
}
