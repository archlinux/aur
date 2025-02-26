# Maintainer: Pierre Ayoub <pierre.ayoub@protonmail.com>
# Contributor: JP-Ellis <josh@jpellis.me>
pkgname=papis-rofi-git
_name=${pkgname//-git}
provides=('papis-rofi')
_pkgver=0.2.0
pkgver=0.2.0.r6.dca26f2
pkgrel=1
pkgdesc="Rofi interface for papis"
arch=('any')
url="https://pypi.org/project/papis-rofi/"
license=('GPL')
depends=('python' 'papis' 'python-papis-python-rofi' 'rofi')
optdepends=()
makedepends=('python-setuptools')
source=(
  "git+https://github.com/papis/papis-rofi.git"
  'fix-bad-document-import-pr12.patch'
)
sha256sums=(
  'SKIP'
  '437a8cd1fe9125b466295e32b701e68442ed3abdc3fc811067961d1c1cf9fd80'
)
noextract=()

prepare() {
  # Mirror pull request #12:
  # https://github.com/papis/papis-rofi/pull/12
  cd "${srcdir}/${_name}"
  patch -p1 -i fix-bad-document-import-pr12.patch
}

pkgver() {
  cd "${srcdir}/${_name}"
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
