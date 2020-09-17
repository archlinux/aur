# Maintainer: Anthony25 <Anthony Ruhier>
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

pkgbase=python2-graphviz
_pkgbase="${pkgbase#python2-}"
pkgname=python2-graphviz
pkgver=0.14.1
pkgrel=1
pkgdesc='Simple Python 2 interface for Graphviz.'
arch=(any)
url='https://github.com/xflr6/graphviz'
license=(MIT)
depends=('graphviz')
makedepends=(
  'python2-setuptools'
)
options=(!emptydirs)
source=("https://github.com/xflr6/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('82248f42e9eacf55d8da13e04297f4bbbce9d1b426e4904359554c57d76dc9e5')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  # do not run python-coverage in unittests :/
  sed -i 's/--cov --cov-report=term --cov-report=html//' setup.cfg
}

build(){
  cd "${srcdir}"/${_pkgbase}-${pkgver}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/${_pkgbase}-${pkgver}

  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgbase}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
