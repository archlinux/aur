# Maintainer: Selene Bray-Hernandez <selebray1998 (at) gmail (dot) com>

pkgname=wwiseutil
pkgver=1.1
pkgrel=1
pkgdesc='Tools for unpacking and modifying Wwise SoundBank and File Package files'
arch=('x86_64')
url='https://github.com/Selene0623/wwiseutil'
license=('GPL-3.0-only')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Selene0623/wwiseutil/archive/master.tar.gz")
sha256sums=('efef78a881eba8f346097de234a211bdb178833b7850a33a58b22843c963a0b4')

prepare() {
  cd "$srcdir"
  mv "$pkgname-master" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  go mod init github.com/hpxro7/wwiseutil
  rm -rf gui
}

build() {
  cd "$pkgname-$pkgver"
  go build \
    -buildmode=pie \
    -trimpath \
    -mod=mod \
    -modcacherw \
    -o wwiseutil ./cmd
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 wwiseutil "$pkgdir/usr/bin/wwiseutil"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
