# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=spral
pkgver=2024.05.08
pkgrel=1
license=('LicenseRef-STFC')
pkgdesc="Sparse Parallel Robust Algorithms Library"
arch=('x86_64')
url="https://github.com/ralna/spral"
makedepends=('meson')
depends=('metis' 'lapack' 'hwloc' 'glibc' 'gcc-libs')
source=("https://github.com/ralna/spral/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0795c10c1c4dab1cf8c2de4024296d75d9d83b7525e82c77584c16060e29e4f5')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  arch-meson build -Dtests=false -Dmodules=false
}

build() {
  cd $srcdir/$pkgname-$pkgver
  meson compile -C build
}

# check() {
#   cd $srcdir/$pkgname-$pkgver
#   meson test -C build --print-errorlogs
# }

package ()
{
  cd $srcdir/$pkgname-$pkgver
  DESTDIR=$pkgdir meson install -C build
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
