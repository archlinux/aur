# Maintainer: Jakov Petrina <jkv.petrina@gmail.com>

pkgname=mboxshell
pkgver=0.4.2
pkgrel=2
pkgdesc="Fast terminal viewer for MBOX files of any size without loading them into memory."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/dcarrero/mboxshell"
license=(MIT)
depends=()
makedepends=('cargo')
source=("https://github.com/dcarrero/mboxshell/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7a8eda4a16b95f6e3e329fc2134aa8dbafbe2f8c1250506d468bb7105da73470')

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
