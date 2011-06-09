# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=obconf
pkgver=2.0.3
pkgrel=4
pkgdesc="A GTK2 based configuration tool for the Openbox windowmanager"
arch=('i686' 'x86_64')
url="http://icculus.org/openbox/index.php/ObConf:About"
license=('GPL')
depends=('openbox' 'gtk2' 'libglade' 'desktop-file-utils' 'libsm')
install=${pkgname}.install
source=("http://icculus.org/openbox/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'http://icculus.org/openbox/mw/images/8/80/Obconf-72.png')
md5sums=('b22e273721851dedad72acbc77eefb68'
         '340ae4732e76731d2838473541eb8d4e')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
  sed -i 's/=openbox/=obconf/' obconf.desktop
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -Dm644 ../Obconf-72.png \
    "${pkgdir}"/usr/share/pixmaps/obconf.png
}
