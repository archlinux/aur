# Maintainer: philanecros <philanecros@gmail.com>

pkgname=go-gpm
pkgver=1.3.2.r10.g7db809e
pkgrel=1
pkgdesc="Barebones dependency manager for Go."
arch=("any")
url="https://github.com/pote/gpm"
license=('MIT')
groups=()
depends=("go")
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://github.com/pote/gpm.git")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}"
  # avoid conflict with existing core/gpm package
  make DESTDIR="$pkgdir/" exec="go-gpm" install
}
