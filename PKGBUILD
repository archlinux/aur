# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=gxi
pkgver=0.4.3
pkgrel=1
pkgdesc="GTK frontend, written in Rust, for the xi editor."
arch=("x86_64")
url="https://github.com/Cogitri/gxi/"
license=('MIT')
make_depends=('meson')
depends=('gtk3' 'rust')
source=("https://github.com/Cogitri/gxi/releases/download/v$pkgver/gxi-$pkgver.tar.xz")
md5sums=('774a75b131df79804bb14bbab4246b23')

# prepare() {
#   cd $pkgname
#   git submodule init
#   git submodule update
# }

build() {
  cd $pkgname-$pkgver
  meson build --prefix /usr/
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
