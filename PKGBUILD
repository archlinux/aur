pkgname=pdftag
pkgver=1.0.4
pkgrel=1
pkgdesc="A simple metadata editor for PDFs"
arch=(i686 x86_64)
url="https://github.com/arrufat/pdftag"
license=(GPL3)
depends=(poppler-glib gtk3)
makedepends=(git vala meson)
_commit=091fa3fa3e54f82fd770e1b6063127788c0f370e
source=("git://github.com/arrufat/pdftag.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's/-/+/g'
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
