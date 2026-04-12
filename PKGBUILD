# Maintainer: Fernando Canatta <your-email-here>
# Previous Maintainer: Jonathon Fernyhough <jonathon+m2x.dev>
# Previous Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Previous Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-gtk-theme-git
_pkgname=numix-gtk-theme
pkgver=2.6.6.r55.gad4b345
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='https://github.com/numixproject/numix-gtk-theme'
license=('GPL-3.0-or-later')
makedepends=('gdk-pixbuf2' 'git' 'glib2' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme engine')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Avoid rebuilding everything again during `make install`.
  sed -i 's/^install: all/install:/' Makefile
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --abbrev=7 --tags \
    | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  make -C "${srcdir}/${_pkgname}"
}

package() {
  make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
