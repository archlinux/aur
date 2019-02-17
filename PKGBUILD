# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=ippusbxd
pkgver=1.33
pkgrel=1
pkgdesc="IPP-over-USB driver"
arch=(i686 x86_64)
url="https://github.com/tillkamppeter/ippusbxd"
license=(Apache)
depends=(avahi libusb)
_commit=8782a5cf9a99c876e197d0f26151ba45c6de68f1
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
