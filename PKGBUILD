pkgname=pdftag
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple metadata editor for PDFs"
arch=(i686 x86_64)
url="https://github.com/arrufat/pdftag"
license=(GPL3)
depends=(poppler-glib gtk4)
makedepends=(git vala meson)
_commit=9693d0d00a8185931746b7708714d3e97982a727
source=("git+https://github.com/arrufat/pdftag.git#commit=$_commit")
md5sums=('963b9f5b9067ff734417ecdefb450373')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's/-/+/g;s/v//'
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
}
