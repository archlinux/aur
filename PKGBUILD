# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aliyunpan
pkgname=${_pkgname}-cli
pkgver=3.0.6
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
sha256sums=('b5452250bcb1c2134b996ceb2f832b3924ea6254c05bbee5c128ae6d413c4554'
            'SKIP'
            '861a40ead90266234e2ecca520ea837e3118f994431053f390f7b81bf45b0fb9')

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
