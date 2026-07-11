# Maintainer: kelon

pkgname=pantheon-monitor
pkgver=8.0.1.r0.g989d694
pkgrel=1
pkgdesc="Manage processes and monitor system resources (GTK4/Granite7)"
arch=('x86_64')
url="https://github.com/elementary/monitor"
license=('GPL3')
depends=(
  'flatpak'
  'glib2'
  'granite7'
  'gtk3'
  'gtk4'
  'json-glib'
  'libadwaita'
  'libgee'
  'libgtop'
  'pciutils'
  'udisks2'
  'wingpanel'
)
makedepends=('git' 'meson' 'sassc' 'vala' 'ninja')
source=("$pkgname::git+https://github.com/elementary/monitor.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  meson setup build --prefix=/usr \
    --wrap-mode default \
    -Dindicator-wingpanel=enabled
  ninja -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" ninja -C build install
}
