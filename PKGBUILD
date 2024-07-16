# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=hyprland-easyfocus
pkgver=0.2.2
pkgrel=4
pkgdesc='A tool to help efficiently focus windows in Hyprland inspired by sway-easyfocus/i3-easyfocus.'
url='https://github.com/abenz1267/hyprland-easyfocus'
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'rustup')
depends=('gtk4-layer-shell')
conflicts=('hyprland-easyfocus')
provides=('hyprland-easyfocus')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2caaa749101986c75d09283ef32e3e30816e1e6d80dd95cbe65fa9508ce82734')
b2sums=('9501ff473f1fc3a2eed25f6754dd06fc216203105c61f40de743c68e010b372f5c1873cf937b1d931b4b0e60620cba4f42cbaa68e046c26815c35fafc836f35b')

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
