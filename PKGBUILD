# Maintainer: secext2022 <secext2022 at outlook dot com>
pkgname=librush
pkgver=0.2.2
pkgrel=1
# https://github.com/fm-elpac/pmim-ibus
pkgdesc="ibus module for pmim (a Chinese pinyin input method)"
arch=('x86_64')
url="https://crates.io/crates/librush"
license=('LGPL-2.1-or-later OR GPL-3.0-or-later')
depends=('ibus>=1.5.33')
makedepends=('rust>=1:1.93')
conflicts=('librush-bin')
optdepends=('flatpak: install pmim from flathub')
source=('librush.tar.gz::https://crates.io/api/v1/crates/librush/0.2.2/download')
sha256sums=('9524559a9867b98a36a14ee4e6e5f0f8842bb174edec9232d9313af049f71727')

build() {
  cd "${srcdir}/librush-0.2.2"

  cargo build --release
}

package() {
  cd "${srcdir}/librush-0.2.2"

  install -Dm755 -t "$pkgdir/usr/lib/pmim" target/release/ibrus
  install -Dm644 -t "$pkgdir/usr/share/ibus/component" aur/pmim_ibrus.xml
}
