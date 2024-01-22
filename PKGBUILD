# Maintainer: zefr0x < Matrix: "@zer0-x:kde.org" >
# Contributor: Kevin Majewski

pkgname=xdg-desktop-portal-gtk-git
_pkgname=xdg-desktop-portal-gtk
pkgver=1.15.1+3+g25e828d
pkgrel=1
pkgdesc="A GTK backend for xdg-desktop-portal"
url="https://github.com/flatpak/xdg-desktop-portal-gtk"
arch=(x86_64)
license=(LGPL)
depends=('gtk3' 'xdg-desktop-portal' 'gsettings-desktop-schemas' 'fontconfig')
makedepends=('git' 'meson' 'cmake')
optdepends=("evince: Print preview")
provides=($_pkgname 'xdg-desktop-portal-impl')
conflicts=($_pkgname)
source=("git+https://github.com/flatpak/xdg-desktop-portal-gtk")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $_pkgname

  arch-meson build -Dwallpaper=disabled -Dsettings=enabled -Dappchooser=enabled -Dlockdown=enabled

  meson compile -C build
}

check() {
  cd $_pkgname

  meson test -C build
}

package() {
  cd $_pkgname
  meson install -C build --destdir "${pkgdir}"
}
