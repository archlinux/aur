# Maintainer: A43 <arirera43 [at] gmail [dot] com>

_pkgname="mxw"
pkgname="$_pkgname-git"
pkgver=v0.2.2.r2.g710c73c
pkgrel=1
pkgdesc="Cross platform CLI tool for Glorious Core v1 compatible wireless mice, based on mow"
arch=('any')
url="https://github.com/dkbednarczyk/mxw.git"
makedepends=('cargo' 'git' 'libusb')
optdepends=('mxw-udev: Use `mxw` without privelige escalation (sudo)')
provides=('mxw')
source=('git+https://github.com/dkbednarczyk/mxw.git')
md5sums=('SKIP')
options=(!lto)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname/;
  cargo build --release
}

package() {
  install -Dm755 \
	$srcdir/${_pkgname}/target/release/${_pkgname} \
	$pkgdir/usr/bin/${_pkgname};
}
