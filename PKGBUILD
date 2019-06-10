# Maintainer: TBK <aur@jjtc.eu>
# Contributor: TBK <aur@jjtc.eu>

pkgname=sdfat-dkms
pkgver=2.1.8.2
pkgrel=1
pkgdesc='FAT12/16/32(VFAT)/64(exFAT) filesytems kernel module - use with DKMS'
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
sha512sums=('6862d051181bbbe79bd0704a9c1eba7b4fdc749c4bd7f4da86058c7ade1ac172b3129487754a55852d042dc049409b2007862888303742d15845eea5b1bb7a59'
            'a4465715178584579309125fee8a6e4203a65ef511cb38367423edd8eab0f1fe39182a604e2a91c7d2602086bbc4d7fcfca10a0704f746deca329dbf056bc4ee'
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
