# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=hyprland-easyfocus
pkgver=0.2.0
pkgrel=1
pkgdesc='A tool to help efficiently focus windows in Sway inspired by sway-easyfocus/i3-easyfocus.'
url='https://github.com/abenz1267/hyprland-easyfocus'
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
depends=('gtk4-layer-shell')
conflicts=('hyprland-easyfocus')
provides=('hyprland-easyfocus')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7474691ac7a3a779587bba87a66f8d3dc14307fa7dea053ee69eb1e9c91984fa')
b2sums=('45e1b90b66939cba19c5a6e84aba256b94157d09eac0f29fd2bcb5e73a06276cafddabb6f14edda0d97782dda9148abb38c7462561b75c5639e5cf3db3fa9656')

build() {
  cd ${pkgname}-${pkgver}

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/hyprland-easyfocus -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
