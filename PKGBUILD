# Maintainer: Alex Avance <aravance(at)gmail(dot)com>

_pkgname=volume-sync
pkgname=$_pkgname-git
pkgver=12.bc57dc4
pkgrel=1
pkgdesc="A utility for keeping volume in sync across multiple pulse volume sinks"
url="https://github.com/aravance/volume-sync"
depends=('libpulse')
makedepends=('cargo')
arch=('x86_64')
source=("volume-sync::git+https://github.com/aravance/volume-sync.git"
        "volume-sync.service")
sha256sums=('SKIP'
            '10491238508343ffe0eda259c65a549c09762ab0d83a13ebd143410d29f87db4')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/user" "volume-sync.service"
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"
}
