# Maintainer: xuanping <a845326948 at gmail dot com>
pkgname=cosmic-ext-applet-inhibit-status
pkgver=0.1.0
pkgrel=2
_commit=a660037fc60389c49b5a168b1fb9cd6f67f51790
_appid=dev.lxp.CosmicInhibitStatus
pkgdesc="COSMIC panel applet showing which programs currently inhibit system sleep"
arch=('x86_64' 'aarch64')
url="https://github.com/lxp-git/cosmic-ext-applet-inhibit-status"
license=('GPL-3.0-only')
depends=('cosmic-panel')
makedepends=('cargo' 'git')
optdepends=(
  'cosmic-comp-inhibit-export: also list Wayland idle-inhibitors (e.g. a browser playing video)'
  'cosmic-idle-inhibit-export: also list org.freedesktop.ScreenSaver inhibitors'
)
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "res/$_appid.desktop" \
    "$pkgdir/usr/share/applications/$_appid.desktop"
  install -Dm644 "res/$_appid-free-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid-free-symbolic.svg"
  install -Dm644 "res/$_appid-blocked-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid-blocked-symbolic.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
