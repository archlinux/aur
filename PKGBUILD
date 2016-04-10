# Maintainer: renzhn <renznn@gmail.com>
pkgname=meow-proxy
pkgver=1.3.4
pkgrel=1
pkgdesc="MEOW is a fork of MEOW that uses whitelist mode"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/renzhn/MEOW"
license=('custom')
depends=()
makedepends=()
source=(meow@.service
        meow_user.service)
sha1sums=('bf9f1c5c58807e39c969d1ec5cb6535579f0dc92'
          '4ab8d5afaf78c992bdd7c45a7fcd7dd4ae3875d5'
          )
conflicts=(meow-proxy-git)

if [ "$CARCH" == x86_64 ]; then
        source+=(meow-$pkgver.gz::https://github.com/renzhn/MEOW/raw/gh-pages/dist/MEOW-linux-amd64-$pkgver.gz)
        sha1sums+=('dc2904d1021ca21b94d6a225a7aaae861b3fe0c7')
elif [ "$CARCH" == i686 ]; then
        source+=(meow-$pkgver.gz::https://github.com/renzhn/MEOW/raw/gh-pages/dist/MEOW-linux-386-$pkgver.gz)
        sha1sums+=('f75759f9b7af633f821e99d5978e75e4634fe643')
elif [ "$CARCH" == arm ]; then
        source+=(meow-$pkgver.gz::https://github.com/renzhn/MEOW/raw/gh-pages/dist/MEOW-linux-arm-$pkgver.gz)
        sha1sums+=('214d8a7062739bf72de6a65468ca1acf1414f10e')
fi

install=$pkgname.install

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/meow-$pkgver $pkgdir/usr/bin/meow
  install -Dm644 meow@.service ${pkgdir}/usr/lib/systemd/system/meow@.service
  install -Dm644 meow_user.service ${pkgdir}/usr/lib/systemd/user/meow.service
}
