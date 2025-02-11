# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=ragnar-git
pkgver=0.49.208c52a
pkgrel=2
pkgdesc="Mount an existing remote LUKS device with NBD over SSH"
arch=('any')
url="https://github.com/gavinhungry/ragnar"
license=('MIT')
depends=('openssh' 'nbd' 'cryptsetup' 'udisks2')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname}
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}"/${pkgname}
  git submodule init
  git submodule update

  mkdir -p "${pkgdir}"/usr/bin

  install -m 755 abash/abash.sh "${pkgdir}"/usr/bin/ragnar
  echo >> "${pkgdir}"/usr/bin/ragnar
  cat ragnar.sh >> "${pkgdir}"/usr/bin/ragnar
}
