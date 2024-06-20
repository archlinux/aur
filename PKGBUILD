# Maintainer: Julian Hornich <julianhornich@googlemail.com>

pkgname=python-pycachesim-git
pkgrel=1
pkgver=r125
pkgdesc="Python Cache Hierarchy Simulator"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/pycachesim"
license=('GPLv3')
# iaca does currently not build from AUR. You might want to install it by hand and uncomment it here
depends=('python' )
makedepends=('git')
source=('git+https://github.com/RRZE-HPC/pycachesim.git')
sha256sums=('SKIP')
provides=('python-pycachesim')
conflicts=('python-pycachesim')

pkgver() {
  cd ${srcdir}/pycachesim
  echo "r"$(git rev-list --count master)
}

package() {
  cd ${srcdir}/pycachesim

	CFLAGS+=" -Wno-error=incompatible-pointer-types"

  # install package
  python setup.py install --root="${pkgdir}"

  # license
  install -Dm644 ${srcdir}/pycachesim/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
