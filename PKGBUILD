# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-bt
pkgver=0.13
pkgrel=1
pkgdesc="Device input event library - keyboards over bluetooth"
url='https://efanomars.com/stmm-input-bt'
arch=('x86_64')
license=('GPL3' 'LGPL3')

depends=('stmm-input' 'bluez' 'bluez-libs' 'dconf')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-bt")
#replaces=("stmm-input-bt")
#conflicts=("stmm-input-bt")

source=('https://efanomars.com/sources/stmm-input-bt-0.13.tar.gz')
sha256sums=('85a506b0a54cab61ef63e2bbcc1d9412da7621f2464711d93b8638d825ddce39')

build() {
  cd "${srcdir}/stmm-input-bt"

  ./scripts/install_stmm-input-bt-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-compile-schemas --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-bt"

  ./scripts/priv/dd_install_stmm-input-bt-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-compile-schemas --no-sudo
}

post_install() {
  glib-compile-schemas "/usr/share/glib-2.0/schemas"
}

post_upgrade() {
  glib-compile-schemas "/usr/share/glib-2.0/schemas"
}

post_remove() {
  glib-compile-schemas "/usr/share/glib-2.0/schemas"
}

