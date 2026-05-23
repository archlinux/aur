# Maintainer: Archisman Panigrahi <apandada1 AT gmail DOT com>

pkgname=tomatillo
pkgver=1.0.5
pkgrel=2
pkgdesc='Tomatillo is a Pomodoro Timer app for your productivity tasks'
arch=(any)
url='https://github.com/diegopvlk/Tomatillo'
license=(GPL-3.0-or-later)
depends=(
  gtk4
  libadwaita
  python
)
makedepends=(
  git
  meson
  blueprint-compiler
)
source=("git+$url.git#tag=v$pkgver")
sha1sums=('SKIP')

build() {
  arch-meson Tomatillo build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  python -m compileall -d /usr/share "$pkgdir/usr/share"
  python -O -m compileall -d /usr/share "$pkgdir/usr/share"
}
