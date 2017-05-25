pkgname=pdftag
pkgver=0.1.0
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
  git describe --tags
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
