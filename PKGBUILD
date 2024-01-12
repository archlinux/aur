# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: SiD

pkgname=leafpad-noheader
_pkgname=leafpad
pkgver=0.8.19
pkgrel=1
pkgdesc="notepad clone for GTK+ 2.0 with print header disabled"
arch=('i686' 'x86_64')
url="http://tarot.freeshell.org/leafpad/"
license=('GPL')
depends=('gtk2' 'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=('intltool')
conflicts=('leafpad')
provides=('leafpad')
source=(http://download.savannah.gnu.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz
        gtkprint.c.diff
        0001_fix_format-security.patch)
b2sums=('8282b37026e06c74078844766e0120b042a1ab70c5718bb6cff8f10893c111b7774ecb544335e271635e948d8d481715bf7f81be16aeaf2a7f12be9e1ed65ea6'
        '5abc216e54b13fbeb0b178ade2473c18add4a877c528387bc5c7fa09377be3d94354d3e833b4dc3d3f475c44dc0d9a5c08f4bca7d32374b893d258534ce10b33'
        'ea5a43b2ee6e7d6a90bc938efaf47f7fde8ab8f93909c2b0424ff300e0fc2120553cc7513e9578c885d63fbc770e1a498162c81ec3505bd48b321a428cf9d36a')


build() {
  cd "${_pkgname}-${pkgver}"
  patch -p0 <../gtkprint.c.diff
  patch -Np2 -i "${srcdir}"/0001_fix_format-security.patch
  ./configure --prefix=/usr --enable-chooser
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  echo 'StartupNotify=true' >> "${pkgdir}/usr/share/applications/leafpad.desktop"
}
