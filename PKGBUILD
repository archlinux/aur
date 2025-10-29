#Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
pkgname=quickbib
pkgver=0.2
pkgrel=1
pkgdesc="QuickBib — DOI/arXiv → BibTeX desktop utility"
url="https://github.com/archisman-panigrahi/quickbib"
license=('GPL3')
arch=('any')
depends=(python python-pyqt6 doi2bib3)
makedepends=(meson ninja pkgconf)
source=("https://github.com/archisman-panigrahi/quickbib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e28a81a66fc486fde6cd1aae6e0208f21899d258d24cc33a607a19c8f6c309e1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
}

build() {
  # run from the source dir so meson can find meson.build
  cd "$srcdir/$pkgname-$pkgver" || return 1
  # configure with system prefix (/usr) — meson will stage install into destdir
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "$srcdir/$pkgname-$pkgver" || return 1
  meson install -C builddir --destdir="$pkgdir"
}
