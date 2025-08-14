# Maintainer: zlicdt <xkicdt1@gmail.com>

pkgname=gensurvey
pkgver=0.1.0
pkgrel=1
epoch=0
pkgdesc="A tool to generate a survey website from JSON"
arch=('x86_64' 'aarch64')
url="https://github.com/zlicdt/gensurvey"
license=('AGPL3')
depends=()
makedepends=('rust' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')      # git sources use SKIP

prepare() {
  cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}/gensurvey"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release
}

check() {
  cd "${srcdir}/${pkgname}/gensurvey"
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo test --release
}

package() {
  cd "${srcdir}/${pkgname}/gensurvey"
  install -Dm0755 "${srcdir}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # install LICENSE
  install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
