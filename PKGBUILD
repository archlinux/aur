# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=r2k
pkgver=1.2
pkgrel=2
url="https://github.com/gitRaiku/r2k"
pkgdesc="A suckless romaji to kana converter"
arch=(any)
license=('GPL-3.0')
depends=('wayland' 'wlroots' 'libx11' 'libxft' 'libxkbcommon' 'freetype2' 'xorg-xwayland')
makedepends=('make' 'wayland-protocols')
install="${pkgname}.install"
source=("https://github.com/gitRaiku/r2k/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/gitRaiku/r2k/releases/download/v$pkgver/config.h")
sha256sums=('054a52dbbf406bfcc6fed4d2c2618feee376e1c1d5b9f870b0016d8097894013'
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
  mv dict/RaikuDict r2kdict
  install -Dm 0755 r2kdict -t "$pkgdir/usr/share/r2k"
  install -Dm 0755 r2k -t "$pkgdir/usr/bin"
  install -Dm 0755 r2kd -t "$pkgdir/usr/bin"
}
