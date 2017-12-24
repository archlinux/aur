# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=photoflare
pkgver=1.4
pkgrel=2
pkgdesc="Quick, simple but powerful Cross Platform image editor."
arch=('i686' 'x86_64')
url="http://photoflare.io/"
license=('GPL3')
depends=('desktop-file-utils' 'graphicsmagick' 'qt5-base')
makedepends=('imagemagick')
replaces=('photofiltrelx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PhotoFlare/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('8b50090147261374d4b96c28ae812867661467dffc8135e420b2291441fa9db8'
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
