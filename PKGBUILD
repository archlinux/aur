# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare
pkgver=1.5
pkgrel=1
pkgdesc='Quick, simple but powerful Cross Platform image editor.'
arch=(x86_64)
url='http://photoflare.io/'
license=(GPL3)
depends=(desktop-file-utils graphicsmagick qt5-base)
replaces=(photofiltrelx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhotoFlare/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('71c991bdcadf7a5aa18636091301cd108980bf5ec0a25a7ec8400bd00d7d7fcd'
            'b8d8a66f80b744efbd4bd30126dcce4c791662fbd831549d908aa047136240fb')

prepare() {
  sed -i '1 s/^/#/' "$pkgname-$pkgver"/PhotoFlare.pro
}

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5 PhotoFlare.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 PhotoFlare "$pkgdir/usr/bin/PhotoFlare"
  install -Dm644 ../photoflare.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 pixmaps/logo.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
