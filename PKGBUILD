# Maintainer: Cristian Gutierrez <cristian@crstian.me>

_pkgname="mow"
pkgname="$_pkgname-git"
pkgver=r30.4452efd
pkgrel=2
pkgdesc="Cross platform CLI tool for Glorious Model O Wireless"
arch=('any')
url="https://github.com/korkje/mow"
makedepends=('cargo' 'git' 'libusb')
provides=('mow')
source=('git+https://github.com/korkje/mow.git')
md5sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd $srcdir/$_pkgname/;
  cargo build --release
}

package() {
  install \
    -Dm755 \
	$srcdir/$_pkgname/target/release/$_pkgname \
	$pkgdir/usr/bin/$_pkgname;
}
