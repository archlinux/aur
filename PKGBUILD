# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=rink
pkgver=0.4.1
pkgrel=2
pkgdesc='Unit conversion tool and library written in rust'
arch=('x86_64')
url=https://github.com/tiffany352/rink-rs
license=('Custom:MPLv2' 'GPL3')
makedepends=('rust')
source=("rink-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'https://github.com/tiffany352/rink-rs/commit/b91f9c1031fc39e298d25efde8b27f26f1061542.patch')
sha512sums=('fa35afd1ea25a0bb3d2963281205f61fb585dd03f60c74771dca8958583389c48d1919c411c8232a8d1da1d6ed06fed9543f200796a682066875d38c69a63218'
            'b2d78026052fdeb86402a6384e15a2edc441426d03ea4cdba0beb37930a5aa004043d33ba93d2b8b76dffa687f5b681adfee5b69939a48fd840fd6b66f76bbdf')

prepare() {
  cd rink-rs-$pkgver
  patch -p1 -i ../b91f9c1031fc39e298d25efde8b27f26f1061542.patch
}

build() {
  cd rink-rs-$pkgver
  cargo build --release
}

check() {
  cd rink-rs-$pkgver
  cargo test --release --lib --tests
}

package() {
  cd rink-rs-$pkgver
  install -Dm644 LICENSE-MPL "$pkgdir"/usr/share/licenses/rink/LICENSE
  install -Dm755 target/release/rink "$pkgdir"/usr/bin/rink
}

# vim:set ts=2 sw=2 et:
