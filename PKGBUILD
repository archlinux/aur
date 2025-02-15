# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=hevc_hdr_editor-git
pkgver=1.0.0.r1.gb28ad98
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/hevc_hdr_editor'
license=('MIT')
makedepends=('git' 'cargo')
depends=('fontconfig')
source=(git+https://github.com/quietvoid/hevc_hdr_editor.git)
sha256sums=('SKIP')
options=('!debug')

pkgver() {
  cd hevc_hdr_editor

  git describe --long HEAD --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cargo fetch \
    --locked \
    --manifest-path hevc_hdr_editor/Cargo.toml
}

build() {
  cargo build \
    --release \
    --frozen \
    --manifest-path hevc_hdr_editor/Cargo.toml
}

check() {
  cargo test \
    --release \
    --frozen \
    --manifest-path hevc_hdr_editor/Cargo.toml
}

package() {
  cd hevc_hdr_editor

  cargo install \
    --frozen \
    --offline \
    --no-track \
    --path . \
    --root "${pkgdir}"/usr

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/hevc_hdr_editor/LICENSE"
}
