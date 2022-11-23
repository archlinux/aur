# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mantas <grawity at gmail dot com>
pkgname=switcheroo-control
pkgver=2.6
pkgrel=3
pkgdesc="D-Bus service to check the availability of dual-GPU"
arch=('x86_64' 'aarch64')
url="https://gitlab.freedesktop.org/hadess/switcheroo-control"
license=('GPL3')
depends=('libgudev' 'python')
makedepends=('git' 'gtk-doc' 'meson' 'python-dbusmock' 'umockdev')
_commit=0dd257edd6b27589d2a1013cda1d2d5f325eee8b  # tags/2.6^0
source=("git+https://gitlab.freedesktop.org/hadess/switcheroo-control.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "$pkgname" build -Dgtk_doc=true -Dtests=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
