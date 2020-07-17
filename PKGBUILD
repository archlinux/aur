# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=mkbootimg
pkgname=$_pkgname-git
pkgver=2020.05.18.r0.g8dd5b5b5
pkgrel=2
pkgdesc="Android mkbootimg + unpackbootimg, forked and updated (osm0sis)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/osm0sis/mkbootimg"
license=('Apache')
source=(${_pkgname}::git+https://github.com/osm0sis/mkbootimg.git)
sha256sums=('SKIP')
provides=($_pkgname unpackbootimg)
conflicts=($_pkgname unpackbootimg)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${_pkgname}"
	sed s/-Werror/-W/g -i Makefile
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
	install -Dm755 mkbootimg "$pkgdir"/usr/bin/mkbootimg-osm0sis
	install -Dm755 unpackbootimg "$pkgdir"/usr/bin/unpackbootimg
}
