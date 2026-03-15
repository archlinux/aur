# Maintainer: agzes <agzes0@proton.me>
pkgname=antiafk-rbx-sober
_pkgname=AntiAFK-RBX-Sober
pkgver=0.1.0
pkgrel=1
pkgdesc="The best program for AntiAFK for Sober (roblox). Or just Sober Anti-AFK."
arch=('x86_64')
url="https://github.com/Agzes/AntiAFK-RBX-Sober"
license=('MIT')
depends=('gtk4')
makedepends=('rust' 'cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v.$pkgver.tar.gz")
sha256sums=('b8518eb34724a0be8a906f6602a29863d22b48db242df516061f6e46e59169a2')

prepare() {
  cd "$_pkgname-v.$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-v.$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname-v.$pkgver"
  cargo test --frozen
}

package() {
  cd "$_pkgname-v.$pkgver"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "dev.agzes.$pkgname.desktop" "$pkgdir/usr/share/applications/dev.agzes.$pkgname.desktop"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
