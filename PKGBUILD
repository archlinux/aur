# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aliyunpan
pkgname=${_pkgname}-cli
pkgver=2.10.1
pkgrel=1
pkgdesc="Aliyunpan CLI"
arch=('any')
url="https://github.com/wxy1343/aliyunpan"
license=("GPL-3.0")
makedepends=('python-setuptools')
depends=('python-click-aliases'
         'python-requests'
         'python-simplejson'
         'python-rsa'
         'python-colorama'
         'python-flask'
         #'python-pyperclip'
         'python-pyperclip-git'
         'python-npyscreen'
         'python-ruamel-yaml'
         'python-ruamel-base'
         'python-treelib'
         'aria2p')
provides=('aliyunpan')
source=(${_pkgname}-${pkgver}.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz"
        dlnap-master.tar::"https://github.com/cherezov/dlnap/archive/master.tar.gz"
        "0001-upgrade-requirements.patch")
sha256sums=('7ed0eb05b0bcd673f1e9786869f1cd99633051fad03b90b7dc52cef9420b0b98'
            'SKIP'
            '716c9542077062d32c59e27f44ddbdb232b9e3774124647d7c67dbcd150f6fd7')

prepare() {
  cd "${_pkgname}-${pkgver}"
  mv -vTf "${srcdir}"/dlnap-master dlnap
  patch -Np1 -i "${srcdir}/0001-upgrade-requirements.patch"
}

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim: set et ts=2 sw=2:
