# Maintainer: Burak <burakberkkeskin@gmail.com>
pkgname=buildg-git
_pkgname=buildg
pkgver=v0.4.1.r8.fe2b44d
pkgrel=1
pkgdesc="Buildg is a tool to interactively debug Dockerfile based on BuildKit."
arch=(x86_64)
url="https://github.com/ktock/buildg"
license=('GPL')
depends=('runc')
makedepends=('git' 'go')
provides=("${_pkgname%-git}")
conflicts=("${_pkgname%}")
replaces=("${_pkgname}")
source=("git+$url")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
  # make install
  install -Dm 755 "out/${_pkgname}" "$pkgdir/usr/local/bin/${_pkgname}"
}
