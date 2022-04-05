# Maintainer: Dan Campbell <dan at compiledworks dot com>
# Contributor: Jesus Alvarez <jeezusjr at gmail dot com>
# Creator: Jan Hambrecht <jaham at gmx dot net>

pkgname=spacenavd
pkgver=1.0
pkgrel=1
pkgdesc="The spacenav project provides a free, compatible alternative, to the proprietary 3Dconnexion device driver and SDK, for their 3D input devices (called 'space navigator', 'space pilot', 'space traveller', etc)."
arch=('x86_64')
url="http://spacenav.sourceforge.net/"
license=('GPL')
makedepends=("libx11")
provides=('spacenavd')
backup=('etc/spnavrc')
source=(https://github.com/FreeSpacenav/spacenavd/releases/download/v$pkgver/spacenavd-$pkgver.tar.gz spacenavd.service)


sha256sums=('8e3af4e8767bc07f9e19773d769c66e169fc752ae305b7ed9f71ede86cc95a9a'
         '5a1122cf44acdf34537bc2ef7c1ad3776872f335b2993d68833c23f999d96c11')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 ${srcdir}/spacenavd.service ${pkgdir}/etc/systemd/system/spacenavd.service
  install -D -m644 ${srcdir}/$pkgname-$pkgver/doc/example-spnavrc ${pkgdir}/etc/spnavrc
}
