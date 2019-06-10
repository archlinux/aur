# Maintainer: TBK <aur@jjtc.eu>
# Contributor: TBK <aur@jjtc.eu>

pkgname=sdfat-dkms
pkgver=2.1.8.2
pkgrel=2
pkgdesc='FAT12/16/32(VFAT)/64(exFAT) file systems kernel module - use with DKMS'
arch=('any')
url='https://github.com/tbk/kernel-sdfat'
license=('GPL-2.0-only')
depends=('dkms')
optdepends=('exfat-utils-nofuse: Tools for managening Exfat')
makedepends=('linux-headers')
conflicts=('vfat' 'exfat' 'exfat-dkms-git' 'sdfat-dkms-git')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TBK/kernel-sdfat/archive/$pkgver.tar.gz"
        dkms.conf
        mount.exfat)
sha512sums=('566050709952aae35d5e68e88231573ead2f6e5c883bff5dce0055a8df9e91318794cd2938b49c51e250e4e5c61083195ce851ccb7f7537317912e1246ea5a83'
            '7fb5e725cd5e8067717a8bd676c1549335012a3af621ffff3f23e53c068bebe9ce1e6ded914bd4537b0f94eb7682ff0892ba180876cb3805d3d5dfd21294ce69'
            '85c54950e69e342221343b8b542fda47f80b9a7104e1097a7f1c9a09f69758ef8881c238d2740f3a21aa2b5cdcb3b9b8224c731ec2e39fa4632f56c2df85bc84')

_builddir="kernel-sdfat-$pkgver"

prepare() {
  # update PACKAGE_VERSION to pkgver
  sed -i "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" "${srcdir}/dkms.conf"
}

package() {
  rm -fr ${_builddir}/{.git,.gitignore}

  mkdir -p "${pkgdir}/usr/src"
  cp -r ${_builddir} "${pkgdir}/usr/src/sdfat-${pkgver}"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/sdfat-${pkgver}/dkms.conf"
  install -Dm755 "${srcdir}/mount.exfat" "${pkgdir}/usr/bin/mount.exfat"
}
