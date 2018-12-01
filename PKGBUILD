# Maintainer: Julian Hornich <julianhornich@googlemail.com>

pkgname=kerncraft-git
pkgrel=1
pkgver=r803
pkgdesc="Loop Kernel Analysis and Performance Modeling Toolkit"
arch=('i686' 'x86_64')
url="https://github.com/RRZE-HPC/kerncraft"
license=('GPLv3')
# iaca does currently not build from AUR. You might want to install it by hand and uncomment it here
depends=('python'
         'python-yaml'
         'python-pycachesim-git'
         'python-sympy'
         'python-pylru'
         'python-numpy'
         'python-pycparser'
         'likwid' )
makedepends=('git')
optdepends=('intel-compiler-base' 'gcc' 'python2-matplotlib')
source=('git+https://github.com/RRZE-HPC/kerncraft.git')
sha256sums=('SKIP')
provides=('kerncraft')

pkgver() {
  cd ${srcdir}/kerncraft
  echo "r"$(git rev-list --count master)
}

package() {
  cd ${srcdir}/kerncraft

  # install package
  python setup.py install --root="${pkgdir}"

  # examples
  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -a ${srcdir}/kerncraft/examples ${pkgdir}/usr/share/${pkgname}/
  chmod -R 655 ${pkgdir}/usr/share/${pkgname}

  # license
  install -Dm644 ${srcdir}/kerncraft/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
