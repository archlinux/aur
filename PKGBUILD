# Maintainer: 
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=abe
pkgver=1.1
pkgrel=10
pkgdesc='Scrolling, platform-jumping, key-collecting, ancient pyramid exploring game'
arch=('i686' 'x86_64')
url='http://abe.sourceforge.net'
license=('GPL')
depends=('sdl_mixer')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname.patch
        $pkgname.desktop)
md5sums=('5537920e1746708e1a631d84d3500f5c'
         '74802a45e21b59d3e3d34f35ade252a4'
         '6ff678e781290bff780da154a32b9767')

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/$pkgname.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -dm755 "$pkgdir"/usr/share/$pkgname/images
  cp -r images/ maps/ sounds/ "$pkgdir"/usr/share/$pkgname/
  cd "$pkgdir"/usr/share/$pkgname/images
  tar -xf "$srcdir"/$pkgname-$pkgver/images/images.tar abe.bmp
  chown root:root abe.bmp
}

# vim:set ts=2 sw=2 et:
