# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=adb-sync-git
pkgver=r14.9b9a704
pkgrel=1
pkgdesc='A tool to synchronize files between a PC and an Android device using the ADB'
url='https://github.com/google/adb-sync'
arch=(any)
depends=(python2)
license=(Apache)
source=(git+https://github.com/google/adb-sync)
sha1sums=('SKIP')

pkgver() {
  cd adb-sync
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed 's|^#!/usr/bin/python|#!/usr/bin/python2|' -i adb-sync/adb-sync
}

package() {
  cd adb-sync
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" adb-sync adb-channel

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
