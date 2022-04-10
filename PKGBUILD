# Maintainer: TestingPlant

pkgname=xdg-desktop-portal-gnome-noprompt-git
_pkgname=xdg-desktop-portal-gnome-noprompt
pkgver=42.0.1+r12+gb9850a5
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal for the GNOME desktop environment without permission prompts"
url="https://gitlab.gnome.org/TestingPlant/xdg-desktop-portal-gnome-noprompt"
arch=(x86_64)
license=(LGPL)
depends=('xdg-desktop-portal-gtk>=1.10.0-2' libadwaita gnome-keyring
         gnome-desktop-4)
makedepends=(xdg-desktop-portal meson git)
optdepends=('evince: Print previews')
provides=(xdg-desktop-portal-gnome xdg-desktop-portal-impl)
conflicts=(xdg-desktop-portal-gnome 'xdg-desktop-portal-gtk<1.10.0-2')
replaces=('xdg-desktop-portal-gtk<1.10.0-2')
options=()
source=("git+https://gitlab.gnome.org/TestingPlant/xdg-desktop-portal-gnome-noprompt.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
