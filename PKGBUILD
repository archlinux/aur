# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-tuner-tweaks
pkgver=0.5.0
pkgrel=2
pkgdesc="Plugin for Tuner that adds more ways to customize GNOME."
arch=('x86_64')
url="https://altlinux.space/alt-gnome/tunertweaks"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libgee'
  'libpeas-2'
  'gnome-desktop-4'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'gnome-tuner'
  'meson'
  'vala'
)
source=("git+https://altlinux.space/alt-gnome/tunertweaks.git#tag=$pkgver")
sha256sums=('710bc03d0d07d477fd2a6e240dd23e269a4b823a09422ccb0fdb103fab9302de')

prepare() {
  cd tunertweaks

  # fix: Update to latest api
  git cherry-pick -n a67aa6892ba519fcdf9cfebf18c3c2d5f837edc0
}

build() {
  arch-meson tunertweaks build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
