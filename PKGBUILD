# Maintainer: gui <aerofrutiger3000@gmail.com>
pkgname=aro-git
_pkgname=aro
pkgver=0.1.0.r0.ge2c778e
pkgrel=1
pkgdesc='Minimal tiling Wayland compositor with spring animations'
arch=('x86_64')
url='https://github.com/simeulinuxkaliaiwr/aro'
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'libinput'
  'libxkbcommon'
  'pango'
  'pixman'
  'scenefx0.5'
  'wayland'
  'wlroots0.20'
)
makedepends=('git' 'meson' 'wayland-protocols')
optdepends=(
  'foot: default terminal (mod+Return)'
  'fuzzel: default launcher (mod+d)'
  'librsvg: SVG wallpapers, including the default one'
  'xdg-desktop-portal-gtk: file pickers and other portal dialogs'
  'xorg-xwayland: X11 applications'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
