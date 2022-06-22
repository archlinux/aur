# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=countdown
pkgver=1.0.4
pkgrel=1
pkgdesc="Track events until they happen or since they happened"
arch=('x86_64' 'aarch64')
url="https://github.com/lainsce/countdown"
license=('GPL3')
depends=('json-glib' 'libadwaita' 'libgee')
makedepends=('meson' 'gobject-introspection' 'vala')
source=(${url}/archive/$pkgver.tar.gz)
b2sums=('50888640305b6185caa6d5d1e5732747ded96055dedf1e52d61ecd0f0c8118f2d315e1044f576f001afce08535badbfc3e6761cad6078c8cdd1ad43cdf2d7259')

build() {
  arch-meson ${pkgname%-git}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
