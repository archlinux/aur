pkgname=exfat-linux-dkms
_gitname=exfat-linux
pkgver=2.2.0_3
pkgrel=1
pkgdesc="This exFAT filesystem module for Linux kernel is based on sdFAT drivers by Samsung, which is used with their smartphone lineups."
arch=('any')
url='https://github.com/arter97/exfat-linux/'
license=('GPL2')
depends=('dkms' 'exfat-utils-nofuse')
conflicts=('exfat' 'exfat-git')
options=('!strip')
source=("$_gitname-${pkgver//_/-}arter97.tar.gz::https://github.com/arter97/exfat-linux/archive/${pkgver//_/-}arter97.tar.gz"
        dkms.conf)
sha512sums=('98dabc98b86d266bfa3f9800de5a94935b458c2b401cdfff473b49612d11046447f44e96b13822009af9891176863ab4c7fb50e26b6187d58c74ac484cb1e34a' 
            'cbb4fff8f158d5feacd6ad9c4ec42e13b70891b532dd89eda5fd5b6327d22b702d69e46a268af73f04eefcf7deef78ba0a5cfb57381e38eb3493136b9628fd43')

prepare() {
  # update PACKAGE_VERSION to pkgver
  sed -i "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" "${srcdir}/dkms.conf"
}

package() {
  rm -fr $_gitname-${pkgver//_/-}arter97/{.git,.gitignore,debian}
  mkdir -p "${pkgdir}/usr/src"
  cp -r $_gitname-${pkgver//_/-}arter97 "${pkgdir}/usr/src/exfat-${pkgver//_/-}"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/exfat-${pkgver//_/-}/dkms.conf"
}
