# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xepub
pkgver=1.0.2
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
sha256sums=('dc9bcd911a51f4da9a28bc5201f9c8f722fcb4a6c543bae754703147a9c8cb3f')

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
