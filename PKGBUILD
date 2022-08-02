# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-gcp-devrel-py-tools'
_name=${pkgname#python2-}
pkgver=0.0.16
_commit='dbc02f5ec965a6672d47a0e8963365970d96db17'
pkgrel=7
pkgdesc='Tools for Cloud Platform Python libraries and samples (Python 2 package)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
makedepends=('python2-setuptools')
# checkdepends=(
#   'python2-google-cloud-core'
#   'python2-retrying'
# )
_reponame='python-repo-tools'
_tarname="${_reponame}-${_commit}"
source=("${_tarname}.tar.gz::https://github.com/GoogleCloudPlatform/${_reponame}/archive/${_commit}.tar.gz")
b2sums=('f7d3a33381753c70e639c23e395a3fb32826f25f3eb766487ae9542a8fe45f441e6cccd9c8473cd8d4c384429a819ad586742e9fa4395e59e05527d432867943')

prepare() {
  cd "${_tarname}"

  echo 'Removing unneeded testing modules...'
  rm -rfv 'gcp_devrel/testing/'
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  depends+=(
    'python2-packaging'
    'python2-pylint'
    'python2-requests'
    'python2-six'
  )

  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --prefix='/usr' --optimize=1 --skip-build
  mv "${pkgdir}/usr/bin/${_name}"{,2}
}
