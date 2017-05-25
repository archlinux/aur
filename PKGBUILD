pkgname=pdftag
pkgver=0+5+gd9a9294
pkgrel=1
pkgdesc="A simple metadata editor for PDFs"
arch=(i686 x86_64)
url="https://github.com/arrufat/pdftag"
license=(GPL3)
depends=(poppler-glib gtk3)
makedepends=(git vala meson)
source=("git://github.com/arrufat/pdftag.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  _count=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short HEAD)
  echo 0+$_count+g$_commit
}

build() {
  cd ${pkgname}
  [ -d build ] && rm -rf build
  mkdir build
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd ${pkgname}/build
  DESTDIR=${pkgdir} ninja install
  install -Dm644 ${srcdir}/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
