# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=8.0.0
pkgrel=2
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
         'python-unicodedata2'
         'python-urllib3'
         'python-xmltodict'
         'sqlite')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-pytest-vcr' 'python-requests-mock')
source=("https://github.com/sopel-irc/sopel/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('dccc620a2a90c7dc9a175e4c76d32dd07a85307087a595ddc8f3156dc7e04326b3a7d8cfe44d7c444d25360e8039ed751dc334a19253bb7f54dbb7502ce594db')

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
