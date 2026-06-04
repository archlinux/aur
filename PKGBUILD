# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari-git
_pkgname=hikari
pkgver=r486.2f0f6d7
pkgrel=2
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://codeberg.org/thomasadam/hikari'
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=(
  'cairo'
  'glibc'
  'glib2'
  'libinput'
  'libucl'
  'libxkbcommon'
  'pam'
  'pango'
  'pixman'
  'wayland'
  'wlroots0.19'
  'xorg-xwayland'
)
provides=('hikari')
conflicts=('hikari')
makedepends=('meson' 'wayland-protocols' 'git')
source=(git+"https://codeberg.org/thomasadam/hikari.git")
sha256sums=('SKIP')

pkgver() {
  cd "hikari"
  #git describe --tags | sed 's/-/+/g'
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
 }


build(){
  arch-meson -Detcprefix=/ "${_pkgname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

