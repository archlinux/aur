# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gonha-git
pkgver=0.2.16.r85.5983264
pkgrel=1
pkgdesc='Light-weight system monitor for Linux'
arch=('any')
url='https://github.com/fredcox/gonha'
license=('MIT')
provides=('gonha')
conflicts=('gonha')
depends=('python-pyqt5'
         'python-ewmh'
         'python-psutil'
         'python-humanfriendly'
         'python-pyinquirer'
         'python-colr'
         'python-distro'
         'python-prompt_toolkit1014'
         'ttf-fira-code')
makedepends=('python-setuptools' 'git')
source=("${pkgname%-git}::git+https://github.com/fredcox/gonha")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "$(grep -Pom1 "(\d+\.)+\d+" setup.py).r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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