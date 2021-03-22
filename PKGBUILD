# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=argos-translate-git
_pkgname=argos-translate
pkgver=r231.8c4e64e
pkgrel=1
pkgdesc="Offline neural machine translation library and GUI."
arch=(any)
url="https://github.com/argosopentech/argos-translate"
provides=('argos-translate' 'argos-translate-cli')
license=(MIT)
depends=('python' 'python-pip')
makedepends=('python-setuptools' 'git')
install="argos-translate-git.install"
source=('git+https://github.com/argosopentech/argos-translate.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_pkgname}
  python setup.py build
}

package() {
  cd ${_pkgname}
  python setup.py install --root="$pkgdir/" --optimize=1
}

