# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=riotkit-do
pkgver=2.3.1
pkgrel=1
pkgdesc='Task executor - balance between Makefile and Gradle. Written in Python. Powerful tool for every DevOps. Automates production tasks as well as local development tasks'
arch=('any')
url='https://github.com/riotkit-org/riotkit-do'
license=('Apache')
depends=('python-yaml'
         'python-pbr'
         'python-jinja'
         'python-dotenv'
         'python-tabulate')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/riotkit-org/riotkit-do/archive/v${pkgver}.tar.gz")
sha256sums=('1447c75d4dca88284717550f3453c676478f85c078ec8315a0438638251b7928')

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
  cp -R rkd/internal "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/rkd"
}
# vim:set ts=2 sw=2 et:
