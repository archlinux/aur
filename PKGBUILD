# Maintainer: José Luis Lafuente <jl@lafuente.me>
# Original maintainer: Michael Louis Thaler <michael.louis.thaler@gmail.com>
pkgname=watchman
pkgver=3.1
pkgrel=0
_patch="690890143518e0fa507dba10aa98b88d3df8e003"
pkgdesc="An inotify-based file watching and job triggering command line utility"
url="https://facebook.github.io/watchman/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('glibc' 'pcre')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facebook/watchman/archive/v${pkgver}.tar.gz"
        "https://github.com/facebook/watchman/commit/${_patch}.patch")
sha256sums=('c463b5cd5d8ccfbe96bdbcdc5a3c04c91c8eae53e1ffa4846a7317a8f6b4f159'
            'd9c0eea3cdff0d1f9fc71720906a4490420c9fc6620271eab6922f875a08761d')

prepare() {
  cd "${srcdir}"
  patch -p1 -d ${pkgname}-${pkgver} < ${_patch}.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
