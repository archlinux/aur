# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-bt
pkgver=0.19
pkgrel=1
pkgdesc="Device input event library - keyboards over bluetooth"
url='https://efanomars.com/libraries/stmm-input-bt'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3' 'LGPL3')

depends=(
    'stmm-input>=0.16'
    'bluez' 'bluez-libs' 'dconf')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-bt")
#replaces=("stmm-input-bt")
#conflicts=("stmm-input-bt")

source=('https://efanomars.com/sources/stmm-input-bt-0.19.tar.gz')
sha256sums=('409653397f65def942592e8e63be2a43bf46ad59886d1bfb7939a0383e8ba1f2')

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

