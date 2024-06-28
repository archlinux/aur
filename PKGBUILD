# Maintainer: Erich Eckner <arch at eckner dot net>

pkgname=python-postpic
_pkgname="${pkgname#*-}"
pkgver=0.4
pkgrel=70
pkgdesc='The open source particle-in-cell post processor.'
url='https://github.com/skuschel/postpic'
arch=('i686' 'pentium4' 'x86_64')
license=('GPL3')
depends=(
  'python-matplotlib'
  'python-numpy>=1.7'
  'python-scipy'
  'python-future'
  'python-urllib3'
  'python-numexpr'
)
makedepends=(
  'python-setuptools'
  'cython'
  'python-h5py'
)
optdepends=(
  'python-h5py: h5 reader for openPMD support'
  'python-sdf:  sdf support for EPOCH reader'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/skuschel/${_pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('c1a2ce68e7df5c4f16b01f46d2e171ac48c3eeddc7b2c219c6b070df5e4e4521b81ff9b7b45b514ff78b4866a1bfa44ad83ce357865c59d3b4f86e274d81fe69')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

#check() {
#  cd "${_pkgname}-${pkgver}"
#  python setup.py test
#}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
