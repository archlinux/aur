# Maintainer: Omar Sandoval <osandov AT cs DOT washington DOT edu>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski AT archlinux.org>
# Contributor: Dan McGee <dpmcgee AT gmail.com>

pkgname=sparse
pkgver=0.5.0
pkgrel=2
pkgdesc='Semantic parser for C'
arch=('i686' 'x86_64')
url='http://sparse.wiki.kernel.org/'
license=('custom:OSL')
depends=('perl' 'libxml2')
source=(https://kernel.org/pub/software/devel/sparse/dist/sparse-$pkgver.tar.xz
        llvm-system-libs.patch)
sha256sums=('921fcf918c6778d1359f3886ac8cb4cf632faa6242627bc2ae2db75e983488d5'
            '7a924373612b1ee81472e831667e6997df9befd9f88791c916a9d1ca18c725b0')

prepare() {
  cd $pkgbase-$pkgver
  patch -Np1 -i ../llvm-system-libs.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/sparse/LICENSE
}
