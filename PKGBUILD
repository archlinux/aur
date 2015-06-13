# Contributor: Tom < reztho at archlinux dot us >
pkgname=spindown
pkgver=0.4.0
pkgrel=6
pkgdesc="Daemon that spins down idle disks"
arch=('i686' 'x86_64')
url="http://code.google.com/p/spindown/"
license=('GPL3')
depends=('sg3_utils')
backup=('etc/spindown.conf')
source=("http://spindown.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
    'spindown.service'
    'spindown.tmpfiles')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make SBINDIR=${pkgdir}/usr/bin DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/etc/*
  install -m 644 ${srcdir}/${pkgname}-${pkgver}/spindown.conf.example \
  ${pkgdir}/etc/spindown.conf
  install -dm 755 ${pkgdir}/usr/lib/systemd/system/
  install -m 644 ${srcdir}/spindown.service ${pkgdir}/usr/lib/systemd/system/spindown.service
  install -dm 755 ${pkgdir}/usr/lib/tmpfiles.d/
  install -m 644 ${srcdir}/spindown.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/spindown.conf
}

md5sums=('9ec7400cdd6540a404039492291f41cf'
         '3dbf50c10ab13964ee7b044ed9006165'
         'a0b4ea847c00b8f363a521039c0f86cd')
