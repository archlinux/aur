# Maintainer: Chuan Ji <chuan@jichu4n.com>

pkgname=pilrc
pkgver=3.2
pkgrel=2
pkgdesc='Palm OS resource compiler'
arch=('i686' 'pentium4' 'x86_64')
url='http://pilrc.sourceforge.net/'
license=('GPL')
makedepends=()
depends=()
optdepends=(
  'prc-tools-remix: C/C++ toolchain for Palm OS'
  'palm-os-sdk-git: Palm OS SDK files')
source=("https://downloads.sourceforge.net/project/pilrc/pilrc/${pkgver}/pilrc-${pkgver}.tar.gz")
sha256sums=('f3d6ea3c77f5d2a00707f4372a212377ab7bd77b3d68c3db7e28a553b235903f')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix errors on modern C compilers.
  cflags="$CFLAGS -std=gnu89 -w"
  CFLAGS="$cflags" \
    ./unix/configure \
    --prefix=/usr
  CFLAGS="$cflags" \
    make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Fix errors on modern C compilers
  make DESTDIR="$pkgdir" install
  install -d "${pkgdir}/usr/share/doc/pilrc"
  cp -dr --no-preserve=ownership doc/* "${pkgdir}/usr/share/doc/pilrc/"
}

# vim:set ts=2 sw=2 et:
