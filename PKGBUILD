# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: rtfreedman  <rob<d0t>til<d0t>freedman< T>googlemail<d0t>com>
# Contributor: Pyro Devil <p.devil@gmail.com>

pkgname=exfat-dkms-git
_gitname=exfat-nofuse
pkgver=166.00c1c3b
pkgrel=1
pkgdesc='Native (nofuse) kernel module for EXtendedFAT support - use with DKMS'
url="https://github.com/evan-a-a/exfat-nofuse"
arch=('any')
license=('GPL2')
depends=('dkms')
makedepends=('git')
options=('!strip')
conflicts=('exfat' 'exfat-git')
source=("git+https://github.com/dorimanx/exfat-nofuse.git"
        "dkms.conf")
sha512sums=('SKIP'
            'cbb4fff8f158d5feacd6ad9c4ec42e13b70891b532dd89eda5fd5b6327d22b702d69e46a268af73f04eefcf7deef78ba0a5cfb57381e38eb3493136b9628fd43')
 
pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  # update PACKAGE_VERSION to pkgver
  sed -i "s/PACKAGE_VERSION=\"[-._ 0-9a-zA-Z]*\"/PACKAGE_VERSION=\"${pkgver}\"/g" ${srcdir}/dkms.conf
}

package() {
  rm -fr ${_gitname}/{.git,.gitignore}

  mkdir -p ${pkgdir}/usr/src
  cp -r ${_gitname} ${pkgdir}/usr/src/exfat-${pkgver}
  
  install -Dm644 ${srcdir}/dkms.conf ${pkgdir}/usr/src/exfat-${pkgver}/dkms.conf
}
