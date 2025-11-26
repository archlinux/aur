#Maintainer: Archisman Panigrahi <apandada1ATgmail.com>
_pkgname=quickbib
pkgname=quickbib-git
pkgver=0.4.1
pkgrel=2
pkgdesc="QuickBib — DOI/arXiv → BibTeX desktop utility"
url="https://github.com/archisman-panigrahi/quickbib"
provides=('quickbib')
conflicts=('quickbib')
license=('GPL3')
arch=('any')
depends=(python python-pyqt6 python-doi2bib3)
makedepends=(meson ninja pkgconf)
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname" || return 1
}

build() {
  # run from the source dir so meson can find meson.build
  cd "$srcdir/$_pkgname" || return 1
  # configure with system prefix (/usr) — meson will stage install into destdir
  meson setup builddir --prefix=/usr
  meson compile -C builddir
}

package() {
  cd "$srcdir/$_pkgname" || return 1
  meson install -C builddir --destdir="$pkgdir"
}
