# Maintainer: TBK <aur@jjtc.eu>
# Contributor: TBK <aur@jjtc.eu>

pkgname=sdfat-dkms
pkgver=2.1.10.6
pkgrel=2
pkgdesc='FAT12/16/32(VFAT)/exFAT filesystem kernel module - use with DKMS'
arch=('any')
url='https://github.com/tbk/kernel-sdfat'
license=('GPL-2.0-only')
depends=('dkms')
optdepends=('exfat-utils-nofuse: Tools for managening Exfat')
makedepends=('linux-headers')
conflicts=('vfat' 'exfat' 'exfat-dkms-git' 'sdfat-dkms-git')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TBK/kernel-sdfat/archive/$pkgver.tar.gz"
        mount.exfat)
sha512sums=('bdfd3ff565a972e6c823ca48bb01bd3b4fe8857bfb90e4061820d1ee8f35b3a78a87eafce97bf19d97662d4bb6bd378a8c6289b2f67c3531e6081a049a11a2ae'
            '85c54950e69e342221343b8b542fda47f80b9a7104e1097a7f1c9a09f69758ef8881c238d2740f3a21aa2b5cdcb3b9b8224c731ec2e39fa4632f56c2df85bc84')

_builddir="kernel-sdfat-$pkgver"

package() {
  rm -fr ${_builddir}/{.git,.gitignore}

  mkdir -p "${pkgdir}/usr/src"
  cp -r ${_builddir} "${pkgdir}/usr/src/sdfat-${pkgver}"

  install -Dm755 "${srcdir}/mount.exfat" "${pkgdir}/usr/bin/mount.exfat"
}
