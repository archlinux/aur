# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

_pkgname="slirp4netns"
pkgname="${_pkgname}-git"
pkgdesc="User-mode networking for unprivileged network namespaces."

pkgver=r54.39e87c0
pkgrel=1

arch=('any')
url="https://github.com/rootless-containers/$_pkgname"
license=('GPL-2.0')

depends=()
makedepends=('git')

provides=($_pkgname)
conflicts=($_pkgname)

source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
	./autogen.sh
	LDFLAGS=-static ./configure --prefix=/usr
	make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
