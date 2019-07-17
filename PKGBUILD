# Maintainer: TBK <aur@jjtc.eu>
# Contributor: TBK <aur@jjtc.eu>

pkgname=sdfat-dkms
pkgver=2.1.10.6
pkgrel=1
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
sha512sums=('220e18e17b3a878afee368ee38c3848a667251f33470c518673fa37c31ed11f59b30f3b95e47880456a2c596da6bc356f60d412f65b960ee8c47e5c7c29b28b1'
            '85c54950e69e342221343b8b542fda47f80b9a7104e1097a7f1c9a09f69758ef8881c238d2740f3a21aa2b5cdcb3b9b8224c731ec2e39fa4632f56c2df85bc84')

_builddir="kernel-sdfat-$pkgver"

package() {
  rm -fr ${_builddir}/{.git,.gitignore}

  mkdir -p "${pkgdir}/usr/src"
  cp -r ${_builddir} "${pkgdir}/usr/src/sdfat-${pkgver}"

  install -Dm755 "${srcdir}/mount.exfat" "${pkgdir}/usr/bin/mount.exfat"
}
