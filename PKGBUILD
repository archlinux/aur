pkgname=exfat-linux-dkms
_gitname=exfat-linux
pkgver=29.b83fe7e0
pkgrel=1
pkgdesc="This exFAT filesystem module for Linux kernel is based on sdFAT drivers by Samsung, which is used with their smartphone lineups."
arch=('any')
url='https://github.com/arter97/exfat-linux/'
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=('exfat' 'exfat-git')
options=('!strip')
source=(git+https://github.com/arter97/exfat-linux/
        dkms.conf)
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  # update PACKAGE_VERSION to pkgver
  sed -i "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" "${srcdir}/dkms.conf"
}

package() {
  rm -fr ${_gitname}/{.git,.gitignore}

  mkdir -p "${pkgdir}/usr/src"
  cp -r ${_gitname} "${pkgdir}/usr/src/exfat-${pkgver}"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/exfat-${pkgver}/dkms.conf"
}
