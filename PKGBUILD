# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=done
pkgver=0.2.1
pkgrel=1
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/done-devs/done"
license=('MPL2')
depends=('gtk4' 'libadwaita' 'libsecret' 'sqlite' 'pango')
makedepends=('cargo' 'git' 'ninja' 'meson')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('e9e22a82a5ba30ae8cb9c553c02c19a07f4c23df30316e806b67bf0c94aebff7')

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
