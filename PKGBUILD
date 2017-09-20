# Maintainer: Julian Wolff <wolff@julianwolff.de>

pkgname=okular-backend-markdown-git
pkgver=r7734.ce5999d51
pkgrel=1
pkgdesc='Markdown backend for Okular (git version)'
arch=(i686 x86_64)
url='http://kde.org/applications/graphics/okular/'
license=(GPL)
depends=(okular discount)
makedepends=(extra-cmake-modules kdoctools git python)
optdepends=()
conflicts=(okular-backend-markdown)
provides=(okular-backend-markdown)
replaces=()
source=('git://anongit.kde.org/okular.git')
sha256sums=('SKIP')

pkgver() {
  cd okular
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../okular \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib
  make -j4
}

package() {
  cd build
  make DESTDIR="$srcdir/install" install
  install -D "$srcdir/install/usr/lib/qt/plugins/okular/generators/okularGenerator_md.so" "$pkgdir/usr/lib/qt/plugins/okular/generators/okularGenerator_md.so"
  install -D "$srcdir/install/usr/share/metainfo/org.kde.okular-md.metainfo.xml" "$pkgdir/usr/share/metainfo/org.kde.okular-md.metainfo.xml"
  install -D "$srcdir/install/usr/share/applications/org.kde.mobile.okular_md.desktop" "$pkgdir/usr/share/applications/org.kde.mobile.okular_md.desktop"
  install -D "$srcdir/install/usr/share/applications/okularApplication_md.desktop" "$pkgdir/usr/share/applications/okularApplication_md.desktop"
  install -D "$srcdir/install/usr/share/kservices5/okularMd.desktop" "$pkgdir/usr/share/kservices5/okularMd.desktop"
}
