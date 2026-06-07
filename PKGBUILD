# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=portfolio-file-manager
pkgver=1.0.3
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
sha256sums=('f0f060aa348587806bc6902284a0d1df07c36ca26ec29c5731abfa1d68e91ebd')

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
