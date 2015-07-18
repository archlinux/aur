# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: falkTX <falktx at gmail dot com>

pkgname=festige
pkgver=1.0.2
pkgrel=2
pkgdesc="A GUI for fst and dssi-vst, allowing you to run Windows VST plugins on Linux."
arch=('i686' 'x86_64')
url="http://festige.sf.net"
license=('GPL2')
optdepends=("dssi-vst: alternative utility")
source=("https://downloads.sourceforge.net/project/festige/${pkgver}/${pkgname}-${pkgver}-src.tar.gz")
sha512sums=('bd5afc4c82334dbec10f48d664fdab0df162ab3de8d50a80941fd44759480af0797ab5db7757b0f0f568f1999f5add03ce348714ae8fe5e739f893743775786e')

if [ "${CARCH}" = 'x86_64' ]; then
  depends=('python2-pyqt4' 'python' 'wine' 'lib32-gtk2' 'lib32-jack')
  makedepends=('gcc-multilib')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('python2-pyqt4' 'gtk2' 'jack' 'python' 'wine')
fi


prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 's#lrelease lang/lang.pro#lrelease-qt4 lang/lang.pro#g' "./Makefile"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install PREFIX=/usr DESTDIR="${pkgdir}/"
}
