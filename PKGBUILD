# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Denommus <yuridenommus@gmail.com>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=lib32-flex
pkgver=2.5.39
pkgrel=1
pkgdesc='A tool for generating text-scanning programs'
arch=('x86_64')
url='http://flex.sourceforge.net'
license=('custom')
depends=('flex' 'lib32-glibc')
source=("http://downloads.sourceforge.net/sourceforge/flex/flex-${pkgver}.tar.bz2")
sha256sums=('add2b55f3bc38cb512b48fad7d72f43b11ef244487ff25fc00aabec1e32b617f')

build() {
  cd flex-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32'
  make
}

package() {
  cd flex-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s flex "${pkgdir}"/usr/share/licenses/lib32-flex
}

# vim: ts=2 sw=2 et:
