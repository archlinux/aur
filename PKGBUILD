# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=davfs2
pkgver=1.6.1
pkgrel=1
pkgdesc="File system driver that allows you to mount a WebDAV folder"
arch=(x86_64)
url="https://savannah.nongnu.org/projects/davfs2"
license=('GPL')
depends=('neon')
backup=(etc/davfs2/davfs2.conf etc/davfs2/secrets)
source=(https://mirror.easyname.at/nongnu/davfs2/${pkgname}-${pkgver}.tar.gz{,.sig})
validpgpkeys=('B25A637BD5625AE122CF4654C1F5593399D2A26E') # Werner Baumann
sha256sums=('ce3eb948ece582a51c934ccb0cc70e659839172717caff173f69a5e2af90c5c0'
            'SKIP')

build() {
  cd ${pkgname}-${pkgver}
  dav_user=nobody dav_group=network ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --disable-debug
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  # This directory contains worthless symlinks
  rm -r "${pkgdir}"/sbin
  rm -f "${pkgdir}"/usr/share/davfs2/{BUGS,COPYING,FAQ,NEWS,TODO,ChangeLog,GPL,README,THANKS}
}
