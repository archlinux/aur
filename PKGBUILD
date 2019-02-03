# Maintainer: Tarn Burton <twburton at gmail dot com>
pkgname=gxi-git
pkgver=r220.ca69043
pkgrel=1
pkgdesc="GTK frontend, written in Rust, for the xi editor."
arch=("x86_64")
url="https://github.com/Cogitri/gxi/"
license=('MIT')
make_depends=('meson')
depends=('gtk3' 'rust')
source=("$pkgname::git+https://github.com/Cogitri/gxi/")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  git submodule init
  git submodule update
}

build() {
  cd $pkgname
  meson build --prefix /usr/
  ninja -C build
}

package() {
  cd $pkgname
  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
