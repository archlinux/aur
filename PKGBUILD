# Maintainer: Felix Schindler <felix at schindlerfamily dot de>
# Contributor: Myles English <myles at rockhead dot biz>
pkgname=fenics-viper
_pkgname=viper
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimalistic scientific plotter and run-time visualization module with support for visualising meshes and solutions in DOLFIN."
arch=('i686' 'x86_64')
url="https://launchpad.net/fenics-viper"
license=('GNU LGPL v2.1')
groups=('fenics-git')
depends=('python2' 'vtk')
makedepends=('git')
conflicts=('viper')
provides=('viper')
options=(!emptydirs)
source=(https://launchpad.net/fenics-viper/1.0.x/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz)
md5sums=('6c4564f67c4b5f8c01425ca3d2cbd2a3')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  find ./ -name "*" -type f -exec \
    sed -i 's#\(/usr/bin/env \|/usr/bin/\)python[2-3]*#\1python2#' {} \;
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
