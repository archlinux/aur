# Maintainer: Jakov Petrina <jkv.petrina@gmail.com>

pkgname=mboxshell
pkgver=0.6.1
pkgrel=1
pkgdesc="Fast terminal viewer for MBOX files of any size without loading them into memory"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/dcarrero/mboxshell"
license=(MIT)
depends=()
makedepends=('cargo')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dcarrero/mboxshell/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2477d862fb9dfc9c2fe26031b642a7c48fde43b578662010847a09708174d099')

build() {
  cd "${pkgname}-${pkgver}"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
