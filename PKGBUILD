# Maintainer: FengZhongShaoNian <2844126834@qq.com>
pkgname=image-annotator-git
pkgver=0.1.0
pkgrel=1
pkgdesc="使用Rust开发的贴图和图片标注工具，支持Linux wayland"
arch=('x86_64')
url="https://github.com/FengZhongShaoNian/annotator"
license=('GPL3')
depends=('wayland' 'libxkbcommon')
makedepends=('cargo-nightly')
source=("git+https://github.com/FengZhongShaoNian/annotator")
sha256sums=('SKIP')
provides=('annotator')
conflicts=('annotator' 'annotator-git')

prepare() {
  # 设置使用 nightly 工具链
  export RUSTUP_TOOLCHAIN=nightly
  cd annotator
  # 使用 --locked 确保依赖版本与 Cargo.lock 严格一致
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd annotator
    cargo build --release
}

package() {
    cd annotator
    install -Dm755 target/release/annotator "$pkgdir/usr/bin/annotator"
    install -Dm644 ../../annotator.desktop "$pkgdir/usr/share/applications/annotator.desktop"
}
