# Maintainer: alvin <alvin@example.com>

pkgname=rime-custom-config-git
pkgver=0.1.0.r2.ga1c41f2
pkgrel=1
pkgdesc="Manage custom Chinese dictionary for fcitx5 rime"
arch=('x86_64')
url="https://github.com/cublueer/rime-custom-config"
license=('MIT')
depends=('gcc-libs' 'fcitx5' 'fcitx5-rime')
makedepends=('cargo')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd rime-custom-config
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd rime-custom-config
  cargo build --release --locked
}

check() {
  cd rime-custom-config
  cargo test --release --locked
}

package() {
  install -Dm755 rime-custom-config/target/release/rime-custom-config \
    "${pkgdir}/usr/bin/rime-custom-config"
}
