# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=8.0.4
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sopel-irc/sopel/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('327bd60753f7f16bab65a029c42cb1f10941b4ea444ff3c240eb951177710d89dd3dc03d3cae58f4b4bdb86036c9f25857e8accf4cc795bbce67326148e03e72')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed 's/setuptools~=66.1/setuptools/' -i pyproject.toml
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
