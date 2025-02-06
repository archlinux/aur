# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=8.0.2
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
url='https://sopel.chat'
license=('EFL-2.0')
depends=('python'
         'python-dnspython'
         'python-importlib-metadata'
         'python-packaging'
         'python-pytz'
         'python-requests'
         'python-sqlalchemy'
         'python-typing_extensions'
         'python-unicodedata2'
         'python-urllib3'
         'python-xmltodict'
         'sqlite')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-vcr' 'python-requests-mock')
source=("https://github.com/sopel-irc/sopel/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('63d45407e2e2e0a18847163c603dbabe0705069d2419810bd8e24ca0a2a067377ae76a894050c5d21bfa4f918a5c7c9d9c81aa4825313d03ec99cdb00b82306e')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed 's/setuptools~=66.1/setuptools/' -i pyproject.toml
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${pkgname}-${pkgver}"
#   PYTHONPATH="${PWD}" pytest
# }

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
