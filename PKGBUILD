# Maintainer: Sam <dev at samarthj dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

# shellcheck disable=2034,2148,2154

pkgname=pyinstaller-hooks-contrib-git
_pkgname=pyinstaller-hooks-contrib
pkgver=2021.3.r199.g50c34f5
pkgrel=1
pkgdesc="Community maintained hooks for PyInstaller"
arch=('any')
url="https://github.com/pyinstaller/pyinstaller-hooks-contrib"
license=('GPL' 'APACHE')
depends=('towncrier' 'python-setuptools' 'python-wheel' 'twine' 'git')
provides=('pyinstaller-hooks-contrib')
conflicts=('pyinstaller-hooks-contrib')
source=("git+https://github.com/pyinstaller/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  commit=$(printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  ver=$(python setup.py --version)
  echo "${ver//-/_}.${commit}"
}

build() {
  cd "$srcdir/$_pkgname" || exit
  python setup.py build
}

package() {
  cd "$_pkgname" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
