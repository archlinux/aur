# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=glacier-cmd-git
pkgver=0.288.cd64261
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
source=(
  "${pkgname}::git+${url}.git#branch=master"
  'no_argparse_dep.patch'
)
md5sums=(
  'SKIP'
  '01a25d647e8a027eccf43e8eb5839803'
)

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
