# Maintainer: sygnmdev <sygnmdev at sygnm dot org>
pkgname=sygnm-git
pkgver=1.0.0alpha1
pkgrel=2
pkgdesc="Computer algebra framework (currently alpha, install only if you know what you are doing)"
arch=('i686' 'x86_64' 'armv6h')
url="https://sygnm.org/"
license=('AGPL3')
depends=('flint' 'arb' 'boost-libs' 'icu' 'gmp' 'qt5-base' 'readline' 'python' 'sqlite' 'libmpc' 'mpfr' 'gmp-ecm' 'eigen' 'ruby' 'jdk7-openjdk')
makedepends=('boost' 'cmake' 'swig' 'python' 'python-setuptools' 'pandoc' 'python-pypandoc' 'ninja')
source=("sygnm-git::git+https://git.sygnm.org/sygnmdev/sygnm.git")
options=(debug !strip)
conflicts=('sygnm')

md5sums=('SKIP')

build() {
  cd "${srcdir}/sygnm-git"
  cmake . -GNinja -DCMAKE_BUILD_TYPE=Debug -DSYGNM_BUILD_ALL=On -DCMAKE_INSTALL_PREFIX=/usr
  ninja -j1
}

package() {
 cd "${srcdir}/sygnm-git"
 DESTDIR="$pkgdir/" ninja install
 cd sygnm-jupyter
 python setup.py install --root="$pkgdir/" --optimize=1
 cd ../sygnm/python
 python setup.py install --root="$pkgdir/" --optimize=1
}
