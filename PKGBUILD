# Maintainer: John Jenkins <twodopeshaggy@gmail.com>

pkgname=guff-git
pkgver=0.6.4002961
pkgrel=1
pkgdesc="reads a stream of points from a file or stdin and plots them."
arch=('i686' 'x86_64')
url="https://github.com/silentbicycle/guff"
license=('MIT')
conflicts=('guff')
makedepends=('git')
source=(
  'git+git://github.com/silentbicycle/guff.git'
)

sha256sums=(
  'SKIP'
)
_gitname="guff"

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_gitname}"
	sed -i -e 's/all: test_${PROJECT}/#all: test_${PROJECT}/' Makefile
        make
}

package() {
	cd "$srcdir/${_gitname}"
        install -vDm755 ${_gitname}   "$pkgdir/usr/bin/${_gitname}"
        install -vDm644 man/${_gitname}.1    "$pkgdir/usr/share/man/man1/${_gitname}.1"
}
