# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
pkgname=cmus-plugin-vgm
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Video Game Music file support for cmus (vgm/vgz/dro/s98)"
arch=('x86_64')
url="https://github.com/jpcima/cmus-plugin-vgm"
license=('Boost' 'GPL')
groups=()
depends=('cmus' 'zlib')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jpcima/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9d0c8c6a6cb43d0b8f419035017e060cebeed1a07da4b468af50943b19c766af49af4004061a33b92c71696ac05e4f2f2180270d375caece8e212dbe5b8b94d4')
noextract=()
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        ..
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" -C build install
  install -vDm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
