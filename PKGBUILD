# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Julian Hornich <julianhornich@googlemail.com>

pkgname=kerncraft-git
pkgrel=3
pkgver=r1290
pkgdesc="Loop Kernel Analysis and Performance Modeling Toolkit"
arch=('any')
url="https://github.com/RRZE-HPC/kerncraft"
license=('GPLv3')
depends=('python'
         'python-pycachesim'
         'python-sympy'
         'python-numpy'
         'python-pycparser'
         'likwid'
         'python-ruamel-yaml'
         'python-compress-pickle'
         'python-osaca'
         'python-psutil'
         'python-setuptools')
makedepends=('git')
optdepends=('iaca' 'gcc' 'python-matplotlib')
source=('git+https://github.com/RRZE-HPC/kerncraft.git')
sha256sums=('SKIP')
provides=('kerncraft')
conflicts=('kerncraft')

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
