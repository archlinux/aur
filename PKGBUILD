# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Based on extra/lablgtk2
pkgname=lablgtk2-full
pkgver=2.18.5
pkgrel=1
pkgdesc="An Objective Caml interface to gtk2, with most bindings to gtk2 libraries"
arch=("i686" "x86_64")
license=('LGPL')
url="http://lablgtk.forge.ocamlcore.org/"
depends=('gtk2' 'gtkspell' 'libgnomecanvas' 'librsvg' 'gtksourceview2')
provides=("lablgtk2==${pkgver}")
conflicts=("lablgtk2")
makedepends=('ocaml>=4.0.3' 'camlp4>=4.03+1')
optdepends=('ocaml: for using the tools')
DLAGENTS=('https::/usr/bin/curl -fLC - --insecure --retry 3 --retry-delay 3 -o %o %u')
source=(https://forge.ocamlcore.org/frs/download.php/1627/lablgtk-${pkgver}.tar.gz)
md5sums=('43eb7062439f7ddd0d8ad96c3e3b87dd')
options=(!makeflags staticlibs)

build() {
  cd "${srcdir}/lablgtk-${pkgver}"
  ./configure --prefix=/usr
  make world
  make opt
}

package() {
  cd "${srcdir}/lablgtk-${pkgver}"
  make DESTDIR=${pkgdir} old-install
  install -m644 META "${pkgdir}/usr/lib/ocaml/lablgtk2/"
}
