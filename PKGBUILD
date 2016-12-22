# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Maintainer: Łukasz Jendrysik <scadu@yandex.com>

pkgname=abuild
pkgver=2.29.0
pkgrel=1
pkgdesc='Script to build Alpine packages'
arch=('i686' 'x86_64')
url='http://git.alpinelinux.org/cgit/abuild/'
license=('GPL2')
depends=('curl' 'openssl')
source=(http://dev.alpinelinux.org/archive/abuild/abuild-$pkgver.tar.xz)
md5sums=('1a51f8786331ddf79bf46357fe938f6a')

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
