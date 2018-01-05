# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: tdy <tdy@gmx.com>
# Contributor: nut543 <kfs1@online.no>

pkgname=vor
pkgver=0.5.7
pkgrel=1
pkgdesc='Classic spaceship versus asteroid field arcade game'
arch=('x86_64')
url='http://jasonwoof.org/vor'
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
makedepends=('gendesk')
optdepends=('netpbm: for customizing game graphics'
            'povray: for customizing game graphics')
options=('!emptydirs')
source=("https://jasonwoof.com/downloads/vor/vor-$pkgver.tgz"
        "$pkgname.png")
sha256sums=('f3411f747fa998d9ae13b5636ecb478a2bd9abc804030f8440c878bd2c6f8f09'
            '07a805928f5cf2b3351e2b9ff820ea69352ad80faad43311889ffbd5f62da872')

prepare() {
  gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  install -d "$pkgdir/usr/bin"
  make -C "$pkgname-$pkgver" prefix=/usr DESTDIR="$pkgdir" install
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
