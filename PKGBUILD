# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshtui
pkgver=0.12.3
pkgrel=1
pkgdesc='Console text-user-interface for Meshtastic'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/PeterGrace/meshtui'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
b2sums=('19b187ac1c7eedc63d2fd356ffcb3c27311c08962c25fe79456cee7af56e423823de374fb20335e7d381b52303af8cdc4e98081d6a06524163e586d246e81bce')

prepare() {
  cd "${pkgname}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  rm .cargo/config.toml # removes hardcoded rustflags
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # license
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
