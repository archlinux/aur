# Maintainer: renzhn <renznn@gmail.com>
pkgname=meow-proxy
pkgver=1.3.4
pkgrel=1
pkgdesc="MEOW is a fork of MEOW that uses whitelist mode"
arch=('i686' 'x86_64')
url="https://github.com/renzhn/MEOW"
license=('custom')
depends=()
makedepends=()
conflicts=(meow-proxy-git)

source=(meow@.service
        meow_user.service)
source_i686+=(meow-i686-$pkgver.gz::https://github.com/renzhn/MEOW/raw/gh-pages/dist/MEOW-linux-386-$pkgver.gz)
source_x86_64+=(meow-x86_64-$pkgver.gz::https://github.com/renzhn/MEOW/raw/gh-pages/dist/MEOW-linux-amd64-$pkgver.gz)

sha1sums=('bf9f1c5c58807e39c969d1ec5cb6535579f0dc92'
          '4ab8d5afaf78c992bdd7c45a7fcd7dd4ae3875d5'
          )
sha1sums_i686+=('f75759f9b7af633f821e99d5978e75e4634fe643')
sha1sums_x86_64+=('dc2904d1021ca21b94d6a225a7aaae861b3fe0c7')

install=$pkgname.install

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/meow-$CARCH-$pkgver $pkgdir/usr/bin/meow
  install -Dm644 meow@.service ${pkgdir}/usr/lib/systemd/system/meow@.service
  install -Dm644 meow_user.service ${pkgdir}/usr/lib/systemd/user/meow.service
}
