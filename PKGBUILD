# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha-git
pkgver=r49.85c99de
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
provides=('gonha')
depends=('python-pyqt5'
         'python-humanfriendly'
         'python-ewmh'
         'python-pathlib'
         'python-configobj'
         'python-colr'
         'python-pyinquirer')
makedepends=('python-setuptools' 'git')
source=("${pkgname%-git}::git+https://github.com/fredcox/gonha")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: