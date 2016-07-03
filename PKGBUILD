# Maintainer: Fabian Maurer <dark.shadow4@web.de>

pkgname=sdfs
pkgver=3.1.7
pkgrel=1
pkgdesc="Deduplication file system from Opendedup"
arch=('x86_64')
url="http://opendedup.org"
license=('GPL2')
depends=('libxml2' 'java-environment' 'fuse')
source=('https://github.com/opendedup/sdfs/archive/3.1.7.zip'
              'mount.patch'
			  'mkfs.patch')
md5sums=('cdc1af3868c8a2660e16796fcee6f636'
                   'SKIP'
				   'SKIP')

prepare() {
  cd ${srcdir}/$pkgname-$pkgver/install-packages/deb
  patch usr/share/sdfs/mount.sdfs < ${srcdir}/mount.patch
  patch usr/share/sdfs/mkfs.sdfs < ${srcdir}/mkfs.patch
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/install-packages/deb
  
  cp -dr --no-preserve=ownership etc ${pkgdir}
  cp -dr --no-preserve=ownership usr ${pkgdir}
  
  install -d ${pkgdir}/usr/bin/
  install -D sbin/* ${pkgdir}/usr/bin
}
