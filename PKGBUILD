# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=touche
pkgver=2.0.8
pkgrel=1
pkgdesc="The desktop application to configure Touchégg "
arch=('x86_64')
url="https://github.com/JoseExposito/touche"
license=('GPL3')
depends=('gjs' 'libadwaita' 'touchegg')
makedepends=('gobject-introspection' 'meson' 'npm')
checkdepends=('appstream-glib')
provides=('libtouche.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7d9c2594c5db1bd3c343f398910c1d1a62393ecde7d44b3af55e6a0f6ca3ef72')

build() {
  cd "$pkgname-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  npm install

  arch-meson . build
  meson compile -C build
}

check() {
  cd "$pkgname-$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/com.github.joseexposito.$pkgname" "$pkgdir/usr/bin/$pkgname"
}
