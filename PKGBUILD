# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

_pkgname="slirp4netns"
pkgname="${_pkgname}-git"
pkgdesc="User-mode networking for unprivileged network namespaces."

pkgver=v0.3.0.r6.g67f04e2
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
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
