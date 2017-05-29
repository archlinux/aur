# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=nct6775-dkms-git
_pkgname=nct6775
pkgver=r148.3100f3c
pkgrel=1
pkgdesc="Nuvoton module for nct67xx chips not yet supported in the kernel."
arch=('i686' 'x86_64')
url="https://github.com/groeck/nct6775"
license=('GPLv2')
makedepends=('git')
source=("git://github.com/groeck/nct6775.git"
        dkms.conf.in)
md5sums=('SKIP'
         'def0cd6481eec8acdae8340655aa278f')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}

  install -dm755 ${pkgdir}/usr/src/${_pkgname}-${pkgver}
  cp -a LICENSE Makefile README* *.h *.c ${pkgdir}/usr/src/${_pkgname}-${pkgver}/
  
  sed -e "s/@PACKAGE_VERSION@/${pkgver}/" ${srcdir}/dkms.conf.in > \
    ${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf
}
