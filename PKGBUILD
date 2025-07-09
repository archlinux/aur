# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=hyprland-easyfocus
pkgver=0.4.1
pkgrel=1
pkgdesc='A tool to help efficiently focus windows in Sway inspired by sway-easyfocus/i3-easyfocus.'
url='https://github.com/abenz1267/hyprland-easyfocus'
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'rustup')
depends=('gtk4-layer-shell')
conflicts=('hyprland-easyfocus')
provides=('hyprland-easyfocus')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('574f22e9ec326612aa96e8683c299e1f28e4856b6b230511d71153f1925b05ea')
b2sums=('a0943f4893c87f71db3dd52ef250acf7e8473f2c0d62560fa66e40d9f0a450a326b6e3a367db5ccbdd34460c580f9f77bd4b1d8cc0e38c7c0c60070c507665ce')

build() {
  cd ${pkgname}-${pkgver}

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  if command -v rustup > /dev/null 2>&1; then
    rustup run stable cargo build --release
  else
    cargo build --release
  fi
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 target/release/hyprland-easyfocus -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
