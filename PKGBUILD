# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-bt
pkgver=0.17
pkgrel=1
pkgdesc="Device input event library - keyboards over bluetooth"
url='https://efanomars.com/libraries/stmm-input-bt'
arch=('x86_64')
license=('GPL3' 'LGPL3')

depends=(
    'stmm-input>=0.14'
    'bluez' 'bluez-libs' 'dconf')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-bt")
#replaces=("stmm-input-bt")
#conflicts=("stmm-input-bt")

source=('https://efanomars.com/sources/stmm-input-bt-0.17.tar.gz')
sha256sums=('81aceeb7a93fc48d8c5ee039cbeabcbf43a5f0e9a6a715469433129d981ce1d9')

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

