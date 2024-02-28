# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=done
pkgver=0.2.2
pkgrel=1
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/done-devs/done"
license=('MPL2')
depends=('gtk4' 'libadwaita' 'libsecret' 'sqlite' 'pango')
makedepends=('cargo' 'git' 'ninja' 'meson')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('fa9a7f4ff28d455a6f91646c1785ce0b0ed80db724f5a961e56aef5174a46a45')

build() {
  local meson_options=(
    --buildtype release
  )

  arch-meson $pkgname-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
