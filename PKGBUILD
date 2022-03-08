# Maintainer: krumelmonster <krumelmonster@zoho.com>

pkgname=squint
pkgver=0.8.3
pkgrel=1
pkgdesc="duplicates the output of a monitor into a X11 window"
arch=('x86_64')
url="https://github.com/a-ba/squint/"
license=('GPL3')
depends=('gtk3')
makedepends=('meson' 'txt2tags')
source=("https://github.com/a-ba/squint/archive/v$pkgver.tar.gz")
sha256sums=('1b5845e359a94bf93e87a8dfb0a3e3df6ad2914e47fa646275a4261a81b638d9')


prepare() {
  cd $pkgname-$pkgver
  sed -i 's/ --mask-email//' squint.1.t2t
}

build() {
  cd $pkgname-$pkgver
  mkdir build || true
  meson setup build
  ninja -C build
}

package() {
  cd $pkgname-$pkgver
  meson configure build --prefix="$pkgdir/usr/"
  ninja -C build install
}
