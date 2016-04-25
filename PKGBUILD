# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=ragnar-git
pkgver=0.37.63d02a4
pkgrel=1
pkgdesc="Mount an existing remote LUKS device with NBD over SSH"
url="https://github.com/gavinhungry/ragnar"
license=('MIT')
arch=('any')
makedepends=('git')
depends=('openssh' 'nbd' 'cryptsetup' 'udisks2')
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

  install -m 755 abash/abash.sh ${pkgdir}/usr/bin/ragnar
  echo >> ${pkgdir}/usr/bin/ragnar
  cat ragnar.sh >> ${pkgdir}/usr/bin/ragnar
}
