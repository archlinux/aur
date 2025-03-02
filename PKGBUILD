# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=portfolio-file-manager
pkgver=1.0.2
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('any')
url="https://github.com/tchx84/Portfolio"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'python-gobject'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=(
  'python-black'
  'python-pyflakes'
  'python-pytest'
  'python-pytest-timeout'
  'xorg-server-xvfb'
)
source=("git+https://github.com/tchx84/Portfolio.git#tag=v$pkgver")
sha256sums=('246969b8bcabfb2b1077de1ab9ff1adc4be101c2dfce2caeadf5fb61ac8bfea1')

build() {
  arch-meson Portfolio build
  meson compile -C build
}

check() {
  dbus-run-session xvfb-run meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/dev.tchx84.Portfolio "$pkgdir/usr/bin/portfolio"
}
