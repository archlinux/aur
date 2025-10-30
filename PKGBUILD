# -*- mode: pkgbuild -*-
# Maintainer  : Troplo <troplo@troplo.com>

pkgname=flowshot
_pkgname=flowshot
pkgver=20.1.1
pkgrel=2
pkgdesc="An automatic Flowinity/PrivateUploader upload wrapper for screenshot utilities (KDE Spectacle). (Source version)"
arch=('i686' 'x86_64')
url="https://github.com/Flowinity/flameshot"
license=('GPL')
depends=(qt6-base hicolor-icon-theme qt6-svg kguiaddons spectacle)
makedepends=(qt6-tools git cmake)
optdepends=('xdg-desktop-portal: To make Sway, Hyprland, and wlroots work'
            'xdg-desktop-portal-wlr: To make Sway, Hyprland, and wlroots work'
            'grim: To make Sway, Hyprland, and wlroots work'
            'xdg-desktop-portal-kde: For KDE Plasma')
provides=(flowshot)
source=("git+https://github.com/Flowinity/flowshot.git#commit=120da074de9863ed2291936b131e019a5c0124a3")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf $pkgver
}

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -S ./ \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_WAYLAND_CLIPBOARD=1 \
      -DUSE_WAYLAND_GRIM=true

  make -j$(nproc --ignore 1)
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
sha256sums=('f0a9e54bee78fa1abb01369afbb6caf4982041af2a9b609628a9ce999a5dfee8')
