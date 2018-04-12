# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=mono-basic
pkgver=4.7
pkgrel=1
pkgdesc="Mono Visual Basic.NET compiler"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL')
url="http://www.mono-project.com/"
depends=('mono')
source=("https://github.com/mono/mono-basic/archive/${pkgver}.tar.gz")
sha384sums=('4f916f37e2a00655cf5533886f3259431abdcdec37d5a18c3a7d056316867605055e5afd1adf792091fca674cb3d5cfa')

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

