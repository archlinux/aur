# Maintainer: fossdd <fossdd@tutanota.com>
# Contributor: Advaith Madhukar <advaith.madhukar@gmail.com>
pkgname=argos-translate-git
_pkgname=argos-translate
pkgver=r231.8c4e64e
pkgrel=1
pkgdesc="Offline neural machine translation library and GUI."
arch=(any)
url="https://github.com/argosopentech/argos-translate"
provides=('argos-translate' 'argos-translate-cli')
license=(MIT)
depends=('python' 'python-pip' 'python-requests' 'python-pyqt5' 'python-stanza' 'python-sentencepiece-git' 'ctranslate2-git')
optdepends=('python-sphinx' 'python-sphinx_rtd_theme')
makedepends=('python-setuptools' 'git')
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
