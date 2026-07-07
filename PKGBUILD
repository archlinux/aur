pkgname=awf-gtk3
pkgver=4.2.0
pkgrel=1
pkgdesc='Theme preview application for GTK 3'
url='https://github.com/luigifab/awf-extended'
license=('GPL3')
arch=('x86_64')
depends=('gtk3' 'libnotify>=0.7.0' 'hicolor-icon-theme')
#makedepends=('autoconf' 'automake' 'desktop-file-utils' 'gcc' 'gettext' 'gtk3')
conflicts=('awf-git')
source=("https://github.com/luigifab/awf-extended/archive/v${pkgver}/awf-extended-${pkgver}.tar.gz")
sha256sums=('17d8374e33e0c520177a87a06551a041d9b7fa926fe054a42e3e9abef694f80f')

prepare() {
  mv "awf-extended-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fi
  ./configure --enable-only-gtk3
  make -s
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dpm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  #install -Dpm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}