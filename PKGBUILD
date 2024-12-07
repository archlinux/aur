# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=r2k
pkgver=1.1
pkgrel=1
url="https://github.com/gitRaiku/r2k"
pkgdesc="A suckless romaji to kana converter"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots' 'libx11' 'libxft' 'libxkbcommon' 'freetype2')
makedepends=('make' 'wayland-protocols')
install="${pkgname}.install"
source=("https://github.com/gitRaiku/r2k/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/gitRaiku/r2k/releases/download/v$pkgver/config.h")
sha256sums=('9a3fbf9c9d72d4c31be8a4c8db0bec4dc0f5091684709b534a216fb31a159ee1'
            'SKIP')

prepare() {
  cp config.h r2k-$pkgver/src/config.h
}

build() {
  cd $srcdir/r2k-$pkgver
  make $MAKEOPTS
}

package() {
  cd "r2k-$pkgver"
  install -Dm 0755 dict/RaikuDict -t "$pkgdir/usr/share/r2k/r2kdict"
  install -Dm 0755 r2k -t "$pkgdir/usr/bin/"
  install -Dm 0755 r2kd -t "$pkgdir/usr/bin/"
}
