# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=mono-basic
pkgver=4.8
pkgrel=1
pkgdesc="Mono Visual Basic.NET compiler"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
url="http://www.mono-project.com/"
depends=('mono')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+https://github.com/mono/mono-basic.git#commit=e31cb702937a0adcc853250a0989c5f43565f9b8")
#source=("https://github.com/mono/mono-basic/archive/${pkgver}.tar.gz")
sha384sums=('SKIP')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR="${srcdir}/weird"
  mkdir -p "${MONO_SHARED_DIR}"

  # build mono
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

