# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xepub
pkgver=1.0.3
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
  'xapp-symbolic-icons'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=('desktop-file-utils')
source=("git+https://github.com/xapp-project/xepub.git#tag=$pkgver")
sha256sums=('c16175ac5c5131e699615e8e7791133c00fb054b4f964a52fb5dfea7efc55a0e')

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
