# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=riotkit-do
pkgver=2.4.0
pkgrel=1
pkgdesc='Task executor - balance between Makefile and Gradle. Written in Python. Powerful tool for every DevOps. Automates production tasks as well as local development tasks'
arch=('any')
url='https://github.com/riotkit-org/riotkit-do'
license=('Apache')
depends=('python-yaml'
         'python-pbr'
         'python-jinja'
         'python-dotenv'
         'python-tabulate'
         'python-jsonschema')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/riotkit-org/riotkit-do/archive/v${pkgver}.tar.gz")
sha256sums=('e1a9a89d9cf9445840af18ef5c7de4c4fb50d9f778e75d60eaf3de00d8cb0b91')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "s|==|>=|g" requirements.txt
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  _pythonversion=$(python --version | awk -F ' ' '{print substr($2, 1, length($2)-2)}')
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R docs/* "${pkgdir}/usr/share/doc/${pkgname}"
  cp -R rkd/misc "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/rkd"
}
# vim:set ts=2 sw=2 et:
