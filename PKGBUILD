# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Andreas Hübner <andhu@gmx.de>

_pkgname='unicode'
pkgname="${_pkgname}-git"
pkgver=2.9.r34.g11c166d
pkgrel=1
pkgdesc='Display unicode character properties on the command line'
url='https://github.com/garabik/unicode'
arch=('any')
license=('GPL-3.0-only')
makedepends=("git" "python-setuptools")
depends=('python' 'unicode-character-database')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+${url}.git"
	"locals.patch::https://github.com/garabik/unicode/pull/25.patch"
)
sha256sums=('SKIP'
            '45f9ba25ced5e67ee0810cc0ff2783ad879d18c5aa4647945fa15109490159c2')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git clean -dfx
  patch -Np1 -i ../locals.patch
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
