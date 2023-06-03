# Maintainer: tarball <bootctl@gmail.com>

pkgname=vigor
pkgver=0.016
pkgrel=1
pkgdesc='nvi with the evil paperclip'
url='https://vigor.sourceforge.net'
arch=(i686 x86_64 aarch64)
license=(BSD)
depends=(glibc ncurses tcl tk)

source=(
  "$pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/vigor/files/vigor/$pkgver/$pkgname-$pkgver.tar.gz/download"
  avoid-sys-stropts-h.patch
  tcl-interp-result.patch
  client-side-fonts.patch
)
sha256sums=('ff2274fdccd549e52415fff8fa3136353d8f501345b1f7f89e8d1a2c8f540b9c' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 <"$srcdir"/avoid-sys-stropts-h.patch
  patch -p1 <"$srcdir"/tcl-interp-result.patch
  patch -p1 <"$srcdir"/client-side-fonts.patch
}

build() {
  cd $pkgname-$pkgver/build
  ./configure --enable-db
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd build
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
