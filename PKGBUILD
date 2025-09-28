# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=savedesktop
pkgver=3.7
pkgrel=1
pkgdesc="Saves your Linux desktop environment configuration"
arch=('any')
url="https://vikdevelop.github.io/SaveDesktop"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'dconf'
  'gtk4'
  'hicolor-icon-theme'
  'libadwaita'
  'python-dbus'
  'python-gobject'
)
makedepends=(
  'git'
  'meson'
)
_commit=c1dbbd5f0545e09bea5f454ff28662cea8b54ed5  # tags/3.7^0
source=("git+https://github.com/vikdevelop/SaveDesktop.git#commit=${_commit}")
sha256sums=('1f21352ea00ad9dba776b8fb0e8b6d9f681ea8a88cf6970c490b68a3ace9216f')

build() {
  arch-meson SaveDesktop build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
