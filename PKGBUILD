# Maintainer: Sergey A <murlakatamenka@disroot.org>

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=falcond
pkgver=1.1.9
pkgrel=1
pkgdesc='Advanced Linux gaming performance daemon'
arch=('x86_64')
url='https://github.com/PikaOS-Linux/falcond'
license=('MIT')
makedepends=('zig>=0.14')
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('ebecd9284008c47419f668f9621ee0875193eac1429ad9f09985436c5e428b7a')

build() {
  cd "$pkgname-$pkgver"

  source "./pika-build-config/amd64-v3.sh"
  echo "$PIKA_BUILD_ARCH" >pika-build-arch
  cd falcond

  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 falcond/zig-out/bin/falcond \
    -t "$pkgdir/usr/bin"

  install -Dm 644 falcond/debian/falcond.service \
    -t "$pkgdir/usr/lib/systemd/system"

  install -Dm 644 LICENSE \
    -t "$pkgdir/usr/share/licenses/${pkgname}"
}
