#Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=quickbib
pkgver=0.3.3
pkgrel=1
pkgdesc="QuickBib: DOI/arXiv → BibTeX desktop utility"
url="https://github.com/archisman-panigrahi/quickbib"
license=('GPL3')
arch=('any')
depends=(python python-pyqt6 doi2bib3)
makedepends=(meson ninja pkgconf)
source=("https://github.com/archisman-panigrahi/quickbib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de403d0275ce7503b07f9b8c28a010a2a5dfb30438860a95c473cdf6c3795458')

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
