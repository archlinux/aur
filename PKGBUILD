# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Johannes Wegener <mail@johanneswegener.de>
pkgname=beesat-sdr-git
pkgver=r14.1f689f7
pkgrel=1
pkgdesc="GnuRadio lib to decode BEESAT"
arch=('x86_64')
url="https://github.com/kappiman/beesat-sdr"
license=('GPL-3.0')
groups=()
depends=('gnuradio')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("$pkgname"::git+'https://github.com/kappiman/beesat-sdr.git'
        'beesat_boost.patch')
noextract=()
sha256sums=('SKIP'
            'baad5f77155b863a93e366ddf45686f4e2adb7e5a877324b6ffc5d915d46e1ad')
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	patch -p1 < ../beesat_boost.patch
}

build() {
	cd "$pkgname"/gr-tnc_nx
	mkdir -p build
	cd build
	cmake  -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
	make
}

#check() {
#}

package() {
	cd "$pkgname"/gr-tnc_nx/build
	make DESTDIR="$pkgdir/" install
}
