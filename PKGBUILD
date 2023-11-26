# Maintainer: Lex Black <autumn-wind@web.de>
# Contributor: Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=waybox
pkgver=0.2.2
pkgrel=1
pkgdesc='Openbox clone on Wayland'
url="https://github.com/wizbright/waybox"
arch=('x86_64')
license=('MIT')
depends=('wlroots>=0.17.0' 'wlroots<0.18.0')
makedepends=('meson' 'wayland-protocols')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wizbright/${pkgname}/archive/${pkgver}.tar.gz
        0001-missing_libxml2_import.patch)
b2sums=('68a2eac9d8f3986a75365ddcf9fcc33c2578e96d4024eb44b4b7ea90e018dc43bf44d3a82fbae105dcea80bf1ff193a9b76c660d934ef145d4eecd949e2eb8e0'
        'eaacd3fc5cd167db7739434eab50b619cf2b063780bfbe166fee70736fd186fbeae149548114ba82f7c5207f83e37550ccef619b42c2ea1011e5bae0da329ed7')


prepare() {
  cd "$pkgname-$pkgver"
  patch -Np2 -i "$srcdir"/0001-missing_libxml2_import.patch
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m 644 "$pkgname-${pkgver}"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

