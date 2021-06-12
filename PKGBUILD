# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: ugur

pkgname=esp-idf-git
_pkgname=esp-idf
pkgver=r18070.1d7068e4be
pkgrel=1
pkgdesc="ESP specific API/libraries from Espressif"
arch=('i686' 'x86_64')
url="https://github.com/espressif/esp-idf"
license=('Apache')
makedepends=('git')
depends=('python' 'python-pyserial')
options=('!strip')
install='esp-idf-git.install'
# source=(esp-idf::git+https://github.com/espressif/esp-idf.git#commit=9a26296a)
source=(esp-idf::git+https://github.com/espressif/esp-idf.git)
md5sums=('SKIP')

prepare() {
  cd $srcdir/${_pkgname}/
  ./tools/set-submodules-to-github.sh  > /dev/null
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/${_pkgname}
	git submodule update --init
}
package() {
  mkdir -p ${pkgdir}/opt/esp-idf-sdk
  cd "${srcdir}/${_pkgname}"
  cp -R . ${pkgdir}/opt/esp-idf-sdk
}
