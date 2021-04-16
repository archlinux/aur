# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=labwc
pkgver=0.2.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/johanmalm/labwc"
arch=('x86_64')
license=('GPL2')
depends=('pango' 'wlroots' 'wayland' 'wayland-protocols' 'xorg-xwayland')
makedepends=('meson' 'scdoc')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/johanmalm/labwc/archive/${pkgver}.tar.gz"
        wlroots_error.patch)
b2sums=('ec4853cd2d839253a1389d7cb7216e4f7c8e8e485fd73b919cad6e7f0afe1f168a9aad0d07447b4fe59a56c3118b2886d7c7fd2ea47646854f5781f287424d59'
        '6305177a8cb60e8aa8018178895e431d61e2bd37cd4fb17ca1470965c235b030952daa02f7e3d251c698e67a2dbd53055e0cdeb18e8a20106c8d1f15f8476b9d')


prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}"/wlroots_error.patch
}

build() {
  cd "$pkgname-$pkgver"
  arch-meson -Dman-pages=enabled ../build
  ninja -v -C ../build
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="${pkgdir}" meson install -C ../build
}
