# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=hgvs
pkgbase='python-hgvs'
pkgname=('python-hgvs' 'python2-hgvs')
pkgver=1.1.1
pkgrel=1
pkgdesc="HGVS Python parser, formatter, mapper, validator"
arch=('any')
url="http://hgvs.readthedocs.io/en/stable/"
license=('Apache')
makedepends=(
  'python' 'python-setuptools'
  'python2' 'python2-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/8a/cd/57dbb98737c3abccd486ca8a216525765ea1d6681bedf72a2227a386f23b/hgvs-1.1.1.tar.gz#md5=fe9996f6eab2e0cb9b43d5397c981ee7)
sha256sums=('b063ee42aabc4a7ed673ad71ba6fb06f7bb953413e1747d9dfae9e94c4ae1b7e')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-hgvs() {
  depends=(
    'python2'
    'python2-attrs'
    'python2-biocommons.seqrepo'
    'python2-biopython'
    'python2-bioutils'
    'python2-configparser'
    'python2-enum34'
    'python2-parsley'
    'python2-psycopg2'
    'python2-six'
  )

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}

package_python-hgvs() {
  depends=(
    'python'
    'python-attrs'
    'python-biocommons.seqrepo'
    'python-biopython'
    'python-bioutils'
    'python-parsley'
    'python-psycopg2'
    'python-six'
  )
  optdepends=('ipython: for hgvs-shell utility')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
