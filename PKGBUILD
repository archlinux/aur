# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="slirp4netns"
pkgdesc="User-mode networking for unprivileged network namespaces."

pkgver="0.2.0"
pkgrel="1"

arch=('any')
url="https://github.com/rootless-containers/$pkgname"
license=('GPL-2.0')

depends=()
makedepends=()

provides=($pkgname)
conflicts=($pkgname)

source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('12e52a05d96d92539df05607f85e47ff701540d8c0dbbdf32a47c3cf2e98da92')

build() {
  cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	LDFLAGS=-static ./configure --prefix=/usr
	make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
