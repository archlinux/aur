# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Krzysztof Stasiorowski <krzysiekst@gmail.com>
# Contribute : Daniel Kamil Kozar <dkk089@gmail.com>

pkgname=qpxtool-speed47-git
pkgver=0.8.1.pl6.r1.gf03c5d1
pkgrel=1
pkgdesc="Access to all available Quality Checks (Q-Checks) on written and blank media, that are available for your drive, speed47 fork"
arch=(x86_64)
url="https://github.com/speed47/qpxtool"
license=(GPL-2.0-or-later)
depends=(qt5-base glibc gcc-libs libpng libpng16.so)
makedepends=(git qt5-tools)
provides=(qpxtool)
conflicts=(qpxtool)
source=("git+https://github.com/speed47/qpxtool.git")
sha256sums=('SKIP')

# NB Original upstream have not made any more commits after v0.8.1 on 2020.11.10
# https://sourceforge.net/p/qpxtool/code/ci/master/tree/

pkgver() {
  cd qpxtool
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd qpxtool
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libdir=/usr/lib

  make
}

package() {
  cd qpxtool
  make DESTDIR="${pkgdir}" install
}
