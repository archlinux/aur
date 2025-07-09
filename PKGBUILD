# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=hyprland-easyfocus
pkgver=0.4.0
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
sha256sums=('4b07234c2cc9abfc574df6d404be48d53095fe9cd5ab5534c6f9471f561adf18')
b2sums=('01f4edf9d1bec3e2c30df9c0cc73c1f2fe62d6b5da3f5df4e32571e85de01212b8fab891433595a1e44c253fade8a6113e817c33480d9bb0fc2c6027645f5b10')

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
