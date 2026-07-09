pkgname=awf-qt6
pkgver=4.2.0
pkgrel=2
pkgdesc='Theme preview application for Qt 6'
url='https://github.com/luigifab/awf-extended'
license=('GPL3')
arch=('x86_64')
depends=('qt6-base' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('qt6-style-globalqss: for theme support')
#makedepends=('autoconf' 'automake' 'desktop-file-utils' 'gcc' 'gettext' 'qt6-base')
source=("https://github.com/luigifab/awf-extended/archive/v${pkgver}/awf-extended-${pkgver}.tar.gz")
sha256sums=('17d8374e33e0c520177a87a06551a041d9b7fa926fe054a42e3e9abef694f80f')

prepare() {
  mv "awf-extended-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  ./configure --prefix=/usr --enable-only-qt6
  make -s
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}