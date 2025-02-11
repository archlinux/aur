# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=skul-git
pkgver=0.46.d38e649
pkgrel=2
pkgdesc="Create, format and mount loopback-based, encrypted LUKS containers"
arch=('any')
url="https://github.com/gavinhungry/skul"
license=('MIT')
depends=('cryptsetup' 'e2fsprogs' 'udisks2')
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

  install -m 755 abash/abash.sh "${pkgdir}"/usr/bin/skul
  echo >> "${pkgdir}"/usr/bin/skul
  cat skul.sh >> "${pkgdir}"/usr/bin/skul
}
