# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=redsea
pkgver=1.0.1
pkgrel=1
pkgdesc="RDS decoder for the command line "
arch=(x86_64 aarch64)
url="https://github.com/windytan/redsea"
license=(MIT)
depends=('glibc' 'gcc-libs' 'libsndfile' 'liquid-dsp' 'nlohmann-json')
makedepends=('meson' 'catch2')
source=(
  "$pkgname-$pkgver.tar.gz"::https://github.com/windytan/$pkgname/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('a24a17b2870da5c5f3780548b49c9ac63a2d22ecd033d394f6e4752c69c663e2')

build() {
  cd $pkgname-$pkgver
  meson setup --prefix /usr build
  meson compile -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR=$pkgdir meson install -C build

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
