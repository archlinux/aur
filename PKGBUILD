# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Michael Wiencek <mwtuea at gmail dot com>

pkgname=echo-icon-theme-git
_gitname=echo-icon-theme
pkgver=r389.4007669
pkgrel=7
pkgdesc="A new generation of icon set to replace the legacy Bluecurve icon set."
url="https://fedorahosted.org/echo-icon-theme/"
arch=('any')
license=('CCPL')
depends=('icon-naming-utils')
makedepends=('git')
optdepends=(
  'mist-icon-theme: for inheriting missing icons'
)
source=('git://git.fedorahosted.org/echo-icon-theme')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  # Use number of revisions as the version itself is too long.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname/base"
  aclocal && automake --add-missing && autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname/base"
  make prefix="$pkgdir"/usr install
}

