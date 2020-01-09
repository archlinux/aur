# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Creator: Jan Hambrecht <jaham at gmx dot net>

pkgname=spacenavd
pkgver=0.7
pkgrel=2
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('x86_64')
url="http://spacenav.sourceforge.net/"
license=('GPL')
optdepends=("libx11")
provides=('spacenavd')
backup=('etc/spnavrc')
source=(https://github.com/FreeSpacenav/spacenavd/releases/download/v$pkgver/spacenavd-$pkgver.tar.gz spacenavd.service)

sha256sums=('d2493c8124c0e615e7b9bc28cbc1fb7cb1ebc2670c8af86745dedc7e142fafce'
         '5a1122cf44acdf34537bc2ef7c1ad3776872f335b2993d68833c23f999d96c11')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 ${srcdir}/spacenavd.service ${pkgdir}/etc/systemd/system/spacenavd.service || return 1
  install -D -m644 ${srcdir}/$pkgname-$pkgver/doc/example-spnavrc ${pkgdir}/etc/spnavrc || return 1
}
