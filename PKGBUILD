# Maintainer: Nicolas Lorin <androw95220@gmail.com> 
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=davfs2
pkgver=1.7.2
pkgrel=2
pkgdesc="File system driver that allows you to mount a WebDAV folder"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/alisarctl/${pkgname}"
license=('GPL')
depends=('neon' 'po4a')
backup=(etc/${pkgname}/${pkgname}.conf etc/${pkgname}/secrets)
validpgpkeys=('51A0F4A0C8CFC98F842EA9A8B94556F81C85D0D5') # Ali Abdallah <aabdallah@suse.com>
source=(https://github.com/alisarctl/${pkgname}/releases/download/rel-${pkgver//./-}/${pkgname}-${pkgver}.tar.gz{,.sig})
sha512sums=('46e37b59069987da0c7a398b6bc8dae56b8ff821aa3c69763f49e9ae018620887b2f30b09877cedec6a620b6d3a3dcc0343d540f8426dc10209b8f9841a120e2'
            'SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  # sed -i 's/31 32 33/31 32 33 34 35/g' configure
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
