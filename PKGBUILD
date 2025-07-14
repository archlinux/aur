# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=8.0.3
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
sha512sums=('5089b264aa05591c9ecd0e479f98af0da490e8cc40207c40d012d2af3a950f9e457a2feb92c7ec9c462bcc3f89af4feb6118d63fbf9bf0dc79db18a4912eca87')

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
