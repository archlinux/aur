# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obconf
pkgver=2.0.3.git20100309
pkgrel=2
pkgdesc="A GTK2 based configuration tool for the Openbox windowmanager"
arch=('i686' 'x86_64')
url="http://openbox.org/wiki/ObConf:About"
license=('GPL')
depends=('openbox' 'gtk2' 'libglade' 'desktop-file-utils' 'libsm')
install=${pkgname}.install
source=("ftp://ftp.archlinux.org/other/community/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'config-file.patch')
md5sums=('d45a1eab18aa25c18280821118368b97'
         '51f5f110f8bc4a89dfb460c3dd4a3be8')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/config-file.patch

  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
