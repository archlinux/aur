# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=faktory-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="High-performance job processing for the polyglot enterprise"
arch=("x86_64")
url="https://github.com/contribsys/faktory"
license=("GPL3")
depends=("redis")
provides=("faktory")
conflicts=("faktory" "faktory-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/faktory_$pkgver-1_amd64.deb")
sha256sums=('9f3286bfc29d7beb384ac613eb25d1449203590d5d857e9d59d85508df05d0b0')

prepare() {
  bsdtar xf data.tar.gz
}

package() {
  mkdir -p "$pkgdir/etc/faktory"
  touch "$pkgdir/etc/faktory/password"
  echo "root" > "$pkgdir/etc/faktory/password"

  mv usr "$pkgdir"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp -a "$pkgdir/usr/share/faktory/systemd/faktory.service" "$pkgdir/usr/lib/systemd/system/faktory.service"
}
