# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=hdr10plus_tool-git
pkgver=1.3.1.r0.gc18ab21
pkgrel=1
pkgdesc='CLI utility to work with HDR10+ in HEVC files'
arch=('x86_64')
url='https://github.com/quietvoid/hdr10plus_tool'
license=('MIT')
makedepends=(
  'git'
  'cargo'
)
conflicts=('hdr10plus_tool')
provides=('hdr10plus_tool')
source=(git+https://github.com/quietvoid/hdr10plus_tool.git)
sha256sums=('SKIP')

pkgver() {
  cd hdr10plus_tool

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cargo fetch \
    --locked \
    --manifest-path hdr10plus_tool/Cargo.toml
}

build() {
  cargo build \
    --release \
    --frozen \
    --manifest-path hdr10plus_tool/Cargo.toml
}

check() {
  cargo test \
    --release \
    --frozen \
    --manifest-path hdr10plus_tool/Cargo.toml
}

package() {
  cd hdr10plus_tool

  cargo install \
    --frozen \
    --offline \
    --no-track \
    --path . \
    --root "${pkgdir}"/usr
}
