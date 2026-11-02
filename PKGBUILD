# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Huynh Thien Khiem <my_github_name 2000 at gmail dot com>

pkgname=euphonica
pkgver=0.99.8
pkgrel=3
pkgdesc="An MPD client with delusions of grandeur, made with Rust, GTK and Libadwaita"
arch=(x86_64)
url=https://github.com/htkhiem/euphonica
license=(GPL-3.0-or-later)
depends=(cairo dbus dconf glib2 glibc gcc-libs graphene gtk4 hicolor-icon-theme
  libadwaita libpipewire libsecret mpd openssl sqlite xdg-desktop-portal-gtk)
makedepends=(cargo clang meson)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}-beta-1.tar.gz)
sha256sums=('457637ffa689dabffaa8d9608d646e3240f9e3209183986b0f66e175fc2220ca')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname-$pkgver-beta-1
  meson setup build --buildtype=release --prefix=/usr
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd $pkgname-$pkgver-beta-1
  meson compile -C build
}

check() {
  cd $pkgname-$pkgver-beta-1
  meson test -C build --print-errorlogs
}

package() {
  cd $pkgname-$pkgver-beta-1
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

# vim: set ts=2 sw=2 et:
