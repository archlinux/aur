# Maintainer:
# Contributor: Yamada Hayao <development@fascode.net>

_pkgname="getoptions"
pkgname="${_pkgname}-git"
pkgver=3.3.2.r0.g139d121
pkgrel=1
pkgdesc="An elegant option/argument parser for shell scripts"
url="https://github.com/ko1nksm/getoptions"
license=('CC0-1.0')
arch=('any')

depends=(
  'bash'
)
makedepends=(
  'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  make
}

package() {
  cd "$_pkgsrc"
  make install PREFIX="$pkgdir/usr"
}
