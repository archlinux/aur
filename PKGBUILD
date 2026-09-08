# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xepub
pkgver=1.0.1
pkgrel=1
pkgdesc="Secure, comfortable, paginated EPUB reader"
arch=('any')
url="https://github.com/xapp-project/xepub"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libsoup3'
  'python-gobject'
  'python-setproctitle'
  'python-xapp'
  'webkit2gtk-4.1'
  'xapp'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=('desktop-file-utils')
source=("git+https://github.com/xapp-project/xepub.git#tag=$pkgver")
sha256sums=('1a2e444cf35edf12987def97762797616969efcdb383057447f61c970b2d95ee')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs

  desktop-file-validate "build/data/$pkgname.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
