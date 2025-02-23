# Maintainer: Nicolas Lorin <androw95220@gmail.com> 
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=davfs2
pkgver=1.7.1
pkgrel=1
pkgdesc="File system driver that allows you to mount a WebDAV folder"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://savannah.nongnu.org/projects/${pkgname}"
license=('GPL')
depends=('neon' 'po4a')
backup=(etc/${pkgname}/${pkgname}.conf etc/${pkgname}/secrets)
validpgpkeys=('51A0F4A0C8CFC98F842EA9A8B94556F81C85D0D5') # Ali Abdallah <aabdallah@suse.com>
source=(https://download-mirror.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha512sums=('187a2ccd8946fbd659cbb96165fe5523c9c4f2ba855087bc0493ebce198a5ec581543576f0dd2a8e5da96c4abcc10bb83fcb3d5b573aa72bd1871a9f3914c364'
            'SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's/31 32 33/31 32 33 34/g' configure
}

build() {
  cd ${pkgname}-${pkgver}
  dav_user=nobody dav_group=network ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --disable-debug
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
