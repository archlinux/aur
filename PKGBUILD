# Maintainer: Sthefany Eduard <uzenyuuki@outlook.com>
pkgname=sway-nvidia-git
pkgbase=sway-nvidia-git
pkgver=1.1.0.g5f91ec20
pkgrel=1
pkgdesc="Sway (Removed flag --allow-unsupported-gpu) — tiling Wayland compositor"
arch=('x86_64')
url="https://github.com/aalyaa/sway"
license=('MIT')
depends=('wayland' 'json-c' 'pcre2')
makedepends=('git' 'meson' 'ninja' 'wlroots-git' 'scdoc' 'wayland-protocols')
provides=('sway')
conflicts=('sway')

source=("git+https://github.com/aalyaa/sway.git")
sha256sums=('SKIP')

pkgver() {
  cd sway
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
  cd sway
  meson setup build --prefix=/usr 
  ninja -C build
}

package() {
  cd sway
  DESTDIR="$pkgdir" ninja -C build install
}

