# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=simple-diary-gtk
pkgver=0.4.1
pkgrel=2
pkgdesc='Simple and lightweight diary app'
arch=('x86_64')
url="https://github.com/johan-bjareholt/${pkgname}"
license=('GPL3')
depends=('libhandy' 'md4c' 'webkit2gtk' 'gtkmdview')
makedepends=('appstream-glib' 'meson')
source=("https://github.com/johan-bjareholt/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a32000eac64bdbd2ea37d0e37c10b112f0b621dc7b316df67be4937eace1dc48')
conflicts=("${pkgname}-git")

#temporary see https://github.com/johan-bjareholt/simple-diary-gtk/commit/7c229e33113af4b40932a367452599b05831a749
prepare() {
  sed -i '28s/.*/"%s", message);/' ${pkgname}-${pkgver}/src/utils.c
}

build() {
  arch-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

#temporary see https://github.com/johan-bjareholt/simple-diary-gtk/commit/7c229e33113af4b40932a367452599b05831a749
#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
