# Maintainer: Adam Thiede <me@adamthiede.com>
pkgname=hkdm
pkgver=0.2.0
pkgrel=1
pkgdesc="Lighter-weight hotkey daemon"
url="https://gitlab.com/postmarketOS/hkdm"
arch=(x86_64 aarch64)
license=("GPL3")
source=(https://gitlab.com/postmarketOS/hkdm/-/archive/${pkgver}/hkdm-${pkgver}.tar.gz
  hkdm.service)
makedepends=(rust libevdev)

build() {
  cd ${srcdir}/hkdm-${pkgver}
  cargo fetch --locked
  cargo build --frozen --no-default-features --release
  cargo test --frozen --no-default-features
}

package() {
  cd "${srcdir}/hkdm-${pkgver}"
  install -Dm644 hkdm.example.toml ${pkgdir}/etc/hkdm/config.d/hkdm.example
  install -Dm755 target/release/hkdm ${pkgdir}/usr/bin/hkdm
  install -Dm644 ${srcdir}/hkdm.service ${pkgdir}/etc/systemd/system/hkdm.service
}

sha512sums=(
"9521eb2a3daaddec4dda6ffdf8af1c4d9dbd31966db3e86e09476e7ff158836870747a8ccef234be3edb12a3014d0dc5863b4219f839aabf5ee68737b76fcf44"
"6e2f6f377e73e2618c14858707ed29cde1ff22614531b33bf3aa825ad7d41c64d69ef8da8db4327813969d9b076d6706df89b6a10c4dace0f29ae6c7f0f456ca"
)
