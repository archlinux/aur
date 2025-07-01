# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

_pkgname='unicode'
pkgname="${_pkgname}-git"
pkgver=2.9.r41.g7df103e
pkgrel=1
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL-3.0-only')
makedepends=("git" "python-setuptools")
depends=('python' 'unicode-character-database')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git clean -dfx
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 unicode.1 -t "$pkgdir"/usr/share/man/man1/
}
