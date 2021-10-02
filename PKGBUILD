# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=aliyunpan
pkgname=${_pkgname}-cli
pkgver=2.7.15
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
sha256sums=('6ff5aff31f52bc3661edcefdfd7c481376d9ab891aa127645a5af914f1c3179e'
            'SKIP'
            'b3cf59b6093121f258d93e32e1e0b70daacb3617366a160b042916ca852834ca')

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
