# Maintainer: SiHuan <sihuan at sakuya.love>

_pkgname=firefox-chrome-manager
pkgname=$_pkgname-git
pkgver=r11.1481abf
pkgrel=1
pkgdesc="Firefox userChrome.css Installer"
url="https://github.com/quininer/firefox-chrome-manager"
arch=(x86_64)
license=(unknown)
depends=(gcc-libs)
makedepends=(cargo git)
source=("git+https://github.com/quininer/firefox-chrome-manager")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd $_pkgname
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
  cd $_pkgname
  RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
  cd $_pkgname
  install -Dt "$pkgdir/usr/bin" target/release/firefox-chrome-manager
  install -Dt "$pkgdir/usr/share/doc/$_pkgname" -m644 README.md
}
