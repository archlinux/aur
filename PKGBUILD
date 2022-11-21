# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=pyspnego
pkgname=python38-${_pkg}
pkgver=0.6.2
pkgrel=1
pkgdesc="SPNEGO Authentication library"
arch=(any)
url="https://github.com/jborean93/pyspnego"
license=(MIT)
depends=(python38-cryptography)
makedepends=(python38-setuptools)
checkdepends=(cython python38-pytest python38-pytest-mock python38-gssapi python38-krb5 python38-ruamel-yaml)
optdepends=('python38-gssapi: Kerberos support'
            'python38-krb5: Kerberos support'
            'python38-ruamel-yaml: YAML configuration')
# No tests in pypi tarball
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('9d82105879363e6af61f3e79ae2070b17575e9cd9a22b6ad5cc539758dc4356f')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH="${PWD}"/build/lib pytest -vv --color=yes
}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
