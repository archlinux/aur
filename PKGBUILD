# -*- mode: pkgbuild -*-
# Maintainer  : Troplo <troplo@troplo.com>

pkgname=flowshot
_pkgname=flowshot
pkgver=20.1.1
pkgrel=1
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
source=("git+https://github.com/Flowinity/flowshot.git#commit=2de5bd00c31652fa51ab77bf282487b0d7856949")

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
sha256sums=('e0ceaea051289da65fc207c37736dd6205abfa980737c4b9fe13deffc01fe0f9')
