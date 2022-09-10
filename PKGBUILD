# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=cutefish-screenlocker
pkgver=0.5
pkgrel=2
pkgdesc="CutefishOS system screen locker"
arch=('x86_64')
url="https://github.com/cutefishos/screenlocker"
license=('GPL')
groups=('cutefish')
depends=('fishui' 'libcutefish')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://github.com/cutefishos/screenlocker/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7b5c2064afe74ff036a840cb73ea51a0b203d4abd2756d983bd160b670374813d851a9b0f8fd0028d3dc3340c1947b8edd153ce4c9cd966d480f4e65fb9f8f76')

build() {
  cd screenlocker-$pkgver

  # https://github.com/cutefishos/screenlocker/issues/2
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DKDE4_KSCREENSAVER_PAM_SERVICE=system-login .
  make
}

package() {
  cd screenlocker-$pkgver
  make DESTDIR="$pkgdir" install
}
