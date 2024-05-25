# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cyberdropdownloader-git
pkgver=r2021.dfb6c14
pkgrel=1
pkgdesc="Bulk Gallery Downloader for Cyberdrop.me and Other Sites"
arch=('any')
url='https://github.com/Jules-WinnfieldX/CyberDropDownloader'
license=('GPL3')
provides=("${pkgname%-git}")
depends=('python')
makedepends=('python-poetry' 'python-pip')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  poetry install --only main
  poetry build
}

package() {
  cd "${pkgname%-git}"
  PIP_CONFIG_FILE=/dev/null pip install --root="$pkgdir/" dist/*.whl
}


# vim:set ts=2 sw=2 et: