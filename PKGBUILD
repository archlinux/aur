# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=leafpad
pkgver=0.8.18.1
pkgrel=8
pkgdesc="A notepad clone for GTK+ 2.0"
arch=('x86_64')
url="http://tarot.freeshell.org/leafpad/"
license=('GPL')
depends=('gtk2')
makedepends=('intltool')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        '0001-truncate.patch')
sha256sums=('959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c'
            '9d9073ec4684e77cd1a6dd0cec4351750f9f61f2a6bab0e97f06ae6d00b7d2c4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 < "${srcdir}/"0001-truncate.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --enable-chooser
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  echo 'StartupNotify=true' >> "${pkgdir}/usr/share/applications/leafpad.desktop"
}
