# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=ippusbxd
pkgver=1.34
pkgrel=2
pkgdesc="IPP-over-USB driver"
arch=(i686 x86_64)
url="https://github.com/OpenPrinting/ippusbxd"
license=(Apache)
depends=(avahi libcups libusb libxml2)
makedepends=(git)
_commit=2b060a933540c077fe328e9d83009a8c57ad06de
source=("git+https://github.com/OpenPrinting/ippusbxd#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed "s/-/.r/; s/-/./"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"

  install -D -m 755 exe/ippusbxd \
                    "$pkgdir"/usr/bin/ippusbxd

  install -D -m 644 systemd-udev/55-ippusbxd.rules \
                    "$pkgdir"/usr/lib/udev/rules.d/55-ippusbxd.rules

  install -D -m 644 systemd-udev/ippusbxd@.service.dummy0 \
                    "$pkgdir"/usr/lib/systemd/system/ippusbxd@.service

  install -D -m 644 readme.md \
                    "$pkgdir"/usr/share/doc/$pkgname/README.md

  install -D -m 644 doc/ippusbxd.8 \
                    "$pkgdir"/usr/share/man/man8/ippusbxd.8
}

# vim: ts=2:sw=2:et
