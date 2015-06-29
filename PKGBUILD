# Maintainer: Jan Hambrecht <jaham at gmx dot net>

pkgname=spacenavd
pkgver=0.6
pkgrel=1
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('i686' 'x86_64')
url="http://spacenav.sourceforge.net/"
license=('GPL')
optdepends=("libx11")
provides=('spacenavd')
backup=('etc/spnavrc')
options=()
install=
source=(http://downloads.sourceforge.net/spacenav/$pkgname-$pkgver.tar.gz spacenavd spacenavd.service)

md5sums=('7e2c04fb8dbb7d39b9ee7b64565e0c4f'
         '27a739300d4de07920879af2d2bdd47f'
         '4d9314d72b4b4e8a7f5100f69f1fdba3')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m755 ${srcdir}/spacenavd ${pkgdir}/etc/rc.d/spacenavd || return 1
  install -D -m644 ${srcdir}/spacenavd.service ${pkgdir}/etc/systemd/system/spacenavd.service || return 1
}
