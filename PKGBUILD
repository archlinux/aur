# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=hyprland-easyfocus
pkgver=0.4.5
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
sha256sums=('20d7f99ce39c2690e0c69e6d576f5fe99f31696efb8c026329c80c4a3215c31c')
b2sums=('fd48bebaa73cd122cb825f9a53737177a042e14d362a98ad09d7281b18292c14a83c242f1e9507ef682c15de2a339c20693194cc9f82afa52bdc9b975bcfeef4')

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
