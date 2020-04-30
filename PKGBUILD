# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-bt
pkgver=0.14
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

source=('https://efanomars.com/sources/stmm-input-bt-0.14.tar.gz')
sha256sums=('0fb45d2bba5efb4549d9f4d89ac6a84fe8b3aa41601c8ac98c34432bec8f4ae1')

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

