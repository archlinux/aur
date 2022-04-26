# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Snaipe

pkgname=criterion
pkgver=2.4.1
pkgrel=1
pkgdesc="A cross-platform C and C++ unit testing framework for the 21th century"
arch=('x86_64')
url="https://github.com/Snaipe/Criterion"
license=('MIT')
depends=('gettext' 'nanomsg' 'libffi' 'libgit2')
makedepends=('meson' 'cmake')
checkdepends=('python-cram')
source=("https://github.com/Snaipe/Criterion/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('d0f86a8fc868e2c7b83894ad058313023176d406501a4ee8863e5357e31a80e7')

build() {
  cd "${pkgname}-${pkgver}"
  arch-meson -Db_pie=false -Db_lto=false build
  meson compile -C build
}

check() {
  cd "${pkgname}-${pkgver}"
  meson test -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --skip-subprojects --destdir "$pkgdir"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
