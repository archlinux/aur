#Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=quickbib
pkgver=0.3.2
pkgrel=1
pkgdesc="QuickBib — DOI/arXiv → BibTeX desktop utility"
url="https://github.com/archisman-panigrahi/quickbib"
license=('GPL3')
arch=('any')
depends=(python python-pyqt6 doi2bib3)
makedepends=(meson ninja pkgconf)
source=("https://github.com/archisman-panigrahi/quickbib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5789f1e9749714674f7b87557d8623ea186ae199001c811fe4cc47b2abe7447')

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
