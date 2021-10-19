# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=faktory-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="High-performance job processing for the polyglot enterprise"
arch=("x86_64")
url="https://github.com/contribsys/faktory"
license=("GPL3")
depends=("redis")
provides=("faktory")
conflicts=("faktory" "faktory-git")
source=("$pkgname-$pkgver.deb::$url/releases/download/v$pkgver/faktory_$pkgver-1_amd64.deb")
sha256sums=('afa100386595342e22d1e6f56179d07859994a3cbf4f4b66b7bc331d3e344a0a')

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
