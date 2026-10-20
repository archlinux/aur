# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=oci-cli
pkgver=3.95.1
pkgrel=1
pkgdesc='Command line interface for Oracle Cloud Infrastructure'
arch=('any')
options=('!strip')
url="https://github.com/oracle/${pkgname}"
license=('Apache-2.0 OR UPL-1.0')
depends=('python' 'python-oci' 'python-arrow' 'python-certifi' 'python-click' 'python-dateutil' 'python-cryptography' 'python-pyopenssl' 'python-jmespath' 'python-terminaltables3' 'python-idna' 'python-pyjwt' 'python-prompt_toolkit' 'python-pytz' 'python-six' 'python-retrying' 'python-wcwidth' 'python-yaml')
makedepends=('python-setuptools')
optdepends=('python-cx-oracle: Used by the database service')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3e64dd4cec9f2a1ec3f6866d305f149667674be83f6fb138c418802d4b8141e4')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i -E "s/^([[:space:]]*')([A-Za-z0-9_.-]+)(([><=~!].*|;.*)?)('.*)$/\1\2\5/" setup.py
  sed -i "s/terminaltables/terminaltables3/g" setup.py src/oci_cli/cli_util.py src/oci_cli/formatting.py
}

build() {
  cd "${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
