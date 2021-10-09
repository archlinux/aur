# Maintainer: Victor <victor@xirion.net>
pkgname=buildkit-git
_pkgname=buildkit
pkgver=r3441.ba673bbd
pkgrel=1
pkgdesc='BuildKit is a toolkit for converting source code to build artifacts in an efficient, expressive and repeatable manner.'
arch=('any')
url="https://github.com/moby/buildkit"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("docker")
makedepends=("git")
source=("git+https://github.com/moby/${_pkgname}.git")

sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # cutting off 'v' prefix that presents in the git tag
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}

