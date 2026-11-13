# Maintainer: miloserdev <miloserdev@protonmail.com>
pkgname=copydisk
pkgver=0.1.0
pkgrel=1
pkgdesc='Make a small sparse image of a GPT disk: same GUIDs/UUIDs, shrunken ext4/LVM rootfs, no mount needed'
arch=('x86_64' 'aarch64')
url='https://github.com/miloserdev/copydisk'
license=('GPL-2.0-only')
depends=('util-linux-libs' 'e2fsprogs')
makedepends=('pkgconf')
checkdepends=('dosfstools' 'python' 'attr')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('985a04b60f656bbc3c18bb61959d9dd37053b9044dc5a9329bb4381120aa656d')

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  # file-backed disks only, no root and no loop devices needed
  make test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 TZ.md "$pkgdir/usr/share/doc/$pkgname/TZ.md"
}
