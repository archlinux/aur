# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
pkgname=wayback-x11
_pkgname=wayback
pkgver=0.1
pkgrel=1
pkgdesc="An experimental X compatibility layer for Wayland."
arch=('x86_64')
url="https://wayback.freedesktop.org/"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots0.19' 'glibc' 'xorg-xwayland' 'scdoc')
makedepends=('meson' 'wayland-protocols')
source=("${_pkgname}-${pkgver}.tar::https://gitlab.freedesktop.org/wayback/wayback/-/archive/$pkgver/""${_pkgname}-${pkgver}.tar")
sha256sums=('673daf69ff37fa4de3494a7c97fc52da6988d884e115cb77cff9a4764b6fae3d')


build() {
  cd "$_pkgname-$pkgver"
  meson setup _build -Dprefix=/usr -Dlibexecdir="lib/$_pkgname"
  cd _build
  meson compile
}

package() {
  cd "$_pkgname-$pkgver/_build"
  meson install --destdir "$pkgdir"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
