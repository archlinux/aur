pkgname=exfat-linux-dkms
gitname=exfat-linux
pkgver=2.2.0
pkgrel=1
pkgdesc="This exFAT filesystem module for Linux kernel is based on sdFAT drivers by Samsung, which is used with their smartphone lineups."
arch=('any')
url='https://github.com/arter97/exfat-linux/'
license=('GPL2')
depends=('dkms' 'exfat-utils-nofuse')
conflicts=('exfat' 'exfat-git')
options=('!strip')
source=("$gitname-$pkgver-1arter97.tar.gz::https://github.com/arter97/exfat-linux/archive/$pkgver-1arter97.tar.gz"
        dkms.conf)
sha512sums=('1b5667235d1521f2b035e88bbf516aa5b0d8c05b77c4a9550279338cc545d081530cccb5eba07722f69c61df0ef8243d8b996be8a38e61ce07ab741c194ec8df' 
            'cbb4fff8f158d5feacd6ad9c4ec42e13b70891b532dd89eda5fd5b6327d22b702d69e46a268af73f04eefcf7deef78ba0a5cfb57381e38eb3493136b9628fd43')

prepare() {
  # update PACKAGE_VERSION to pkgver
  sed -i "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" "${srcdir}/dkms.conf"
}

package() {
  rm -fr $gitname-$pkgver-1arter97/{.git,.gitignore,debian}
  mkdir -p "${pkgdir}/usr/src"
  cp -r $gitname-$pkgver-1arter97 "${pkgdir}/usr/src/exfat-${pkgver}"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/exfat-${pkgver}/dkms.conf"
}
