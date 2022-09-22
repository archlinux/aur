# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=clairvoyant
pkgver=3.0.1
pkgrel=1
pkgdesc="Magic 8-Ball fortune teller of sorts"
arch=('x86_64' 'aarch64')
url="https://github.com/cassidyjames/clairvoyant"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
source=($url/archive/$pkgver.tar.gz)
b2sums=('2f58e06f56eef50e121abd042b32776eae93466da000109559af8b3e24a3e0ddeac6936e7c3c30975bae313d25e0200bd09db4f01a84d5d8a929e797a99afc1f')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
