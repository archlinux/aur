#Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=quickbib
pkgver=0.3.1
pkgrel=1
pkgdesc="QuickBib — DOI/arXiv → BibTeX desktop utility"
url="https://github.com/archisman-panigrahi/quickbib"
license=('GPL3')
arch=('any')
depends=(python python-pyqt6 doi2bib3)
makedepends=(meson ninja pkgconf)
source=("https://github.com/archisman-panigrahi/quickbib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d13c572f811d6c7d6f09a75986c468ef0e6f6ae80c3d19f0122f11fb4d1c31cc')

prepare() {
  cd "$srcdir/QuickBib-$pkgver" || return 1
}

build() {
  # run from the source dir so meson can find meson.build
  cd "$srcdir/QuickBib-$pkgver" || return 1
  # configure with system prefix (/usr) — meson will stage install into destdir
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "$srcdir/QuickBib-$pkgver" || return 1
  meson install -C builddir --destdir="$pkgdir"
}
