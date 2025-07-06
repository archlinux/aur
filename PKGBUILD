# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=alt-panelmoded
pkgver=0.6.1
pkgrel=1
pkgdesc="Used for panelmode on Alt operating systems with GNOME"
arch=('x86_64')
url="https://gitlab.gnome.org/Armatik/alt-panelmoded"
license=('GPL-3.0-or-later')
depends=(
  'dconf'
  'libgee'
)
makedepends=(
  'meson'
  'vala'
)
optdepends=(
  'gnome-shell-extension-appindicator'
  'gnome-shell-extension-arc-menu'
  'gnome-shell-extension-clipboard-indicator'
  'gnome-shell-extension-dash-to-panel'
  'gnome-shell-extension-gtk4-desktop-icons-ng'
  'gnome-shell-extensions: Removable Drive Menu & Launch New Instance'
)
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('49a6251d15a1695a5de68c108002f465dbde17ad37e30150215efad61da04445')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
