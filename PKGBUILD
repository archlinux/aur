# Maintainer: Digvijay Mahapatra <mahapatra.digvijay at gmail dot com>

pkgname=innu-git
pkgver=0.1.2.r0.gc1428c4
pkgrel=1
pkgdesc='A beautiful, minimal, and fast Wi-Fi manager for Linux built with Rust and egui.'
arch=('x86_64')
url='https://github.com/gitfudge0/innu'
license=('MIT')
depends=('networkmanager')
makedepends=('cargo' 'git')
provides=('innu')
conflicts=('innu' 'innu-bin')
source=("git+https://github.com/gitfudge0/innu.git"
  'innu.desktop')
sha256sums=('SKIP'
  '03e59187e530f73298f6636a38ee4d8731cac003118c511a445d715e9130eb94')

pkgver() {
  cd innu
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd innu
  cargo build --release
}

check() {
  cd innu
  cargo test
}

package() {
  cd innu

  install -Dm755 "target/release/innu" "$pkgdir/usr/bin/innu"
  install -Dm644 "$srcdir/innu.desktop" "$pkgdir/usr/share/applications/innu.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
