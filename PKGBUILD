# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=skul-git
pkgver=0.40.c1e21a1
pkgrel=1
pkgdesc="Create, format and mount loopback-based, encrypted LUKS containers"
url="https://github.com/gavinhungry/skul"
license=('MIT')
arch=('any')
makedepends=('git')
depends=('cryptsetup' 'e2fsprogs' 'udisks2')
source=("${pkgname}::git+${url}.git#branch=master")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git submodule update

  mkdir -p ${pkgdir}/usr/bin

  install -m 755 abash/abash.sh ${pkgdir}/usr/bin/skul
  echo >> ${pkgdir}/usr/bin/skul
  cat skul.sh >> ${pkgdir}/usr/bin/skul
}
