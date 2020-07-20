# Author: metak <https://bbs.archlinux.org/viewtopic.php?id=225365>
# Contributor: Edmund Lodewijks <e.lodewijks@gmail.com>

pkgname=caja-deja-dup-bzr
pkgver=0.0.6.r22
pkgrel=2
pkgdesc="Deja Dup extension for Caja File Browser"
url="https://launchpad.net/deja-dup-caja"
arch=('any')
license=('GPL3')
groups=()
depends=('deja-dup' 'python-caja')
makedepends=('bzr' 'python-distutils-extra')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::bzr+lp:deja-dup-caja" "https://launchpadlibrarian.net/481328025/dejadup.patch")

pkgver() {
  cd ${pkgname%-*}
  version=$(grep -oP 'version      = "\K[^"]+' setup.py)
  printf "%s.r%s" "$version" "$(bzr revno)"
}

prepare() {
  cd "$srcdir/${pkgname%-*}/caja-extension"
  patch --verbose --input="${srcdir}/dejadup.patch"
}

package() {    
  cd ${pkgname%-*}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
md5sums=('SKIP'
         '0f658216602c43508f56ea0e227308af')
md5sums=('SKIP'
         '0f658216602c43508f56ea0e227308af')
