# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=ndsplus-git
pkgver=r8.93f517c
pkgrel=3
pkgdesc="Linux support for the EMS NDS Adapter+"
arch=(i686 x86_64)
url=https://github.com/Thulinma/ndsplus
license=(GPL)
depends=(pkg-config libusb)
makedepends=(git)
provides=(ndsplus)
conflicts=(ndsplus)
source=(git+https://github.com/Thulinma/ndsplus.git
        ndsadapterplus.rules)
sha256sums=('SKIP'
            '03fa9595fbb440bc4d78df2f4655eddb0ad29bc2f2860f2e0dd701a14601c9ac')

pkgver() {
  cd ndsplus
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd ndsplus
  make
}

package() {
  install -Dm0755 ndsplus/ndsplus "$pkgdir/usr/bin/ndsplus"
  install -Dm0644 ndsadapterplus.rules \
    "$pkgdir/etc/udev/rules.d/ndsadapterplus.rules"
}
