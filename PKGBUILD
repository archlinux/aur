# Maintainer:
# Contributor: quellen <lodgerz@gmail.com>

## useful links
# https://pypi.org/project/amitools
# https://github.com/cnvogelg/amitools

_pkgname="amitools"
pkgname="$_pkgname-git"
pkgver=0.8.0.r0.gcfef841
pkgrel=1
pkgdesc="Various tools for using AmigaOS programs on other platforms"
url="https://github.com/cnvogelg/amitools"
license=('GPL-2.0-only')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
optdepends=(
  'python-lhafile'
  #'machine68k: cpu emulator for vamos'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" "$(ls -1 dist/*.whl | sort -rV | head -1)"
}
