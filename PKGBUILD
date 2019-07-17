# Maintainer: TBK <aur@jjtc.eu>
# Contributor: TBK <aur@jjtc.eu>

pkgname=sdfat-dkms
pkgver=2.1.10.3
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
sha512sums=('86c39aab2384475f55805c6851f61c02a19b7843a1c17a5f0ea8933da07e491a1af814789e8b4fb4b8aed4b734e0ca832d7813aa3640a0ef337fa9022e2615d3'
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

  install -Dm755 "${srcdir}/mount.exfat" "${pkgdir}/usr/bin/mount.exfat"
}
