# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare
pkgver=1.5.1
pkgrel=1
pkgdesc='Quick, simple but powerful Cross Platform image editor.'
arch=(x86_64)
url='http://photoflare.io/'
license=(GPL3)
depends=(desktop-file-utils graphicsmagick qt5-base)
replaces=(photofiltrelx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhotoFlare/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('23318461b44aa6163dbcd79cb49c7eb7bc5c26696b1b1436ec01aa449c0d8616')

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
  install -Dm644 installers/deb/DEBIAN/usr/share/applications/photoflare.desktop \
    "$pkgdir/usr/share/applications/photoflare.desktop"
  sed -i 's|Icon=PhotoFlare|Icon=/usr/share/pixmaps/PhotoFlare.png|' "$pkgdir/usr/share/applications/photoflare.desktop"
  install -Dm644 assets/pixmaps/logo.png "$pkgdir/usr/share/pixmaps/PhotoFlare.png"
}
