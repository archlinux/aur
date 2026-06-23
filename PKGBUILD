# Maintainer: Wiktor W. <wykwit@disroot.org>

pkgname='git-file-history-rs'
_pkgname='git-file-history'
pkgver=0.1.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc='TUI for browsing the Git history of a single file'
url='https://gitlab.com/wykwit/git-file-history'
license=('MIT')
makedepends=('cargo' 'rust')
depends=('git')
provides=("${_pkgname}")
arch=('x86_64' 'i686')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('fc81be3acec8f3d3acc52c112ef4fb2b46f17ef79bc26dfad96e93eae46c1bab')

prepare() {
  cd "${_pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}

package() {
  cd "${_pkgname}-${_pkgver}"

  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./LICENSE.txt
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" ./README.md
}

