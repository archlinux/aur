# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=abuild
pkgver=2.27.0
pkgrel=1
pkgdesc='Script to build Alpine packages'
arch=('i686' 'x86_64')
url='http://git.alpinelinux.org/cgit/abuild/'
license=('GPL2')
depends=('curl' 'openssl')
source=(http://dev.alpinelinux.org/archive/abuild/abuild-$pkgver.tar.xz)
md5sums=('c67e4c971c54b4d550e16db3ba331f96')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e "/^CHOST=/s/=.*/=$CHOST/" abuild.conf
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 abuild.conf "$pkgdir"/etc/abuild.conf
}
