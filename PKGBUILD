# Maintainer: Lia Bertran Roca <lia@bertran.xyz>

pkgname=wstui
pkgver=0.0.1alpha1
pkgrel=1
pkgdesc='A terminal frontend for WhatsApp'
url='https://github.com/NullSeile/wstui'
license=(MIT)
makedepends=('cargo' 'wayland' 'go')
depends=('chafa')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf2d4ae400fd4dae2e4ee672bee42f1e1740980fe601e1951cabb239d9589c20')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
