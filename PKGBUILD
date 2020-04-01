# Maintainer: Ben Bergman <ben at benbergman dot ca>

pkgname=spacenav-plus
pkgver=0.5
pkgrel=1
pkgdesc="spacenav plus is a fork of an old version of spacenavd that adds support for some old serial 3D mice such as the SpaceBall 5000"
arch=('x86_64')
url="https://github.com/BenBergman/spacenav-plus"
license=('GPL')
optdepends=("libx11")
provides=('spacenavd')
backup=('etc/spnavrc')
source=(https://github.com/BenBergman/spacenav-plus/archive/v$pkgver.tar.gz spacenavd.service)

sha256sums=('0979db4e60d7a59b6fb1f396f540d1222ba65ce5b78ef8489e17faf70c9d3a66'
         '5a1122cf44acdf34537bc2ef7c1ad3776872f335b2993d68833c23f999d96c11')

build() {
  cd ${pkgname}-${pkgver}/trunk/spacenavd
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${pkgname}-${pkgver}/trunk/spacenavd
  #mkdir -p "${pkgdir}"/bin/
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 ${srcdir}/spacenavd.service ${pkgdir}/etc/systemd/system/spacenavd.service || return 1
  install -D -m644 ${srcdir}/$pkgname-$pkgver/trunk/spacenavd/doc/example-spnavrc ${pkgdir}/etc/spnavrc || return 1
}
