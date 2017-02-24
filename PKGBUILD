# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=glacier-cmd-git
pkgver=0.290.9f28132
pkgrel=1
pkgdesc="Amazon Glacier command-line utility"
arch=('any')
url="https://github.com/uskudnik/amazon-glacier-cmd-interface"
license=('MIT')
depends=(
  'python2'
  'python2-distribute'
  'python2-dateutil'
  'python2-prettytable'
  'python2-pytz'
  'python2-boto-git'
)
makedepends=('git')
options=(!emptydirs)

source=("${pkgname}::git+${url}.git#branch=master"
        'no_argparse_dep.patch')

sha256sums=('SKIP'
            '082b4d0a3caca951744b7b11105d59db53f8c333cc12fd0ad76c3a9a3ebf5c77')

pkgver () {
  cd "${srcdir}/${pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  cd "${srcdir}"
  patch -p0 < no_argparse_dep.patch

  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
