# Maintainer: Aspenini <aspeninifeltner@gmail.com>

pkgname=aurpush
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI for maintaining and publishing Arch Linux packages to the AUR"
arch=('x86_64')
url="https://github.com/Aspenini/aurpush"
license=('MIT')

depends=(
  'git'
  'openssh'
  'pacman'
  'gcc-libs'
)

makedepends=('xmake')

options=('!debug')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  xmake config -y -P . -m release
  xmake -y -P .
}

package() {
  cd "$pkgname-$pkgver"

  xmake install -y -P . \
    --root \
    --headers=n \
    --libraries=n \
    -o "$pkgdir/usr" \
    aurpush

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
