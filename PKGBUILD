# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=xepub
pkgver=1.0.0
pkgrel=1
pkgdesc="Secure, comfortable, paginated EPUB reader"
arch=('any')
url="https://github.com/xapp-project/xepub"
license=('LicenseRef-unknown')
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
sha256sums=('4d698774aa6b1f56da80ea1225492c7fed629b00313e7c3dca2a14eb36f985b3')

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
