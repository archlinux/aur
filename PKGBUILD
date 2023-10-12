# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=done
pkgver=0.2.0
pkgrel=2
pkgdesc="Done is a simple to do app that aims to improve on the existing set of features provided to do apps to deliver the ultimate experience."
arch=('x86_64')
url="https://github.com/done-devs/done"
license=('MPL2')
depends=('gtk4' 'libadwaita' 'pkg-config' 'sqlite' 'pango>=1.51.1')
makedepends=('cargo' 'git' 'ninja' 'meson')
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('5d910b11bd1363224469673b07416a638569a98f709bbd74bfee5aa24449a25c')
#sha256sums=('SKIP')

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
