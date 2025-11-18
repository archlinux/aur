# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sven Hesse <drmccoy@drmccoy.de>

pkgname=xoreos-tools-git
pkgver=0.0.6.r143.g9ecd99f
pkgrel=1
pkgdesc="Tools to help with xoreos development"
arch=(x86_64)
url="https://github.com/xoreos/xoreos-tools"
license=(GPL-3.0-or-later)
depends=(glibc gcc-libs zlib xz libxml2 boost-libs)
makedepends=(git boost)
provides=(xoreos-tools)
conflicts=(xoreos-tools)
source=("git+https://github.com/xoreos/xoreos-tools.git")
sha256sums=('SKIP')

pkgver() {
  cd xoreos-tools
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd xoreos-tools
  ./autogen.sh
}

build() {
  cd xoreos-tools
  ./configure --with-release=AUR --with-lto --prefix=/usr
  make
}

package() {
  cd xoreos-tools
  make DESTDIR="$pkgdir/" install
}
