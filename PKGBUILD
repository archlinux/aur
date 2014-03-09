# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Xavius <xavierelf@gmail.com>

pkgname=lib32-portaudio
pkgver=19_20140130
pkgrel=1
pkgdesc='A free, cross-platform, open source, audio I/O library. (32 bit)'
arch=('x86_64')
url="http://www.portaudio.com/"
license=('custom')
depends=('lib32-alsa-lib' 'lib32-jack' "${pkgname#*-}")
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://www.portaudio.com/archives/pa_stable_v${pkgver}.tgz")
sha256sums=('8fe024a5f0681e112c6979808f684c3516061cc51d3acc0b726af98fc96c8d57')

build() {
  cd "${srcdir}"/${pkgname#*-}

# Multilib
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

# Build
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package () {
  cd "${srcdir}"/${pkgname#*-}

# Install
  make DESTDIR="${pkgdir}" install

# Multilib
  rm -rf "${pkgdir}"/usr/include

# License
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s ${pkgname#*-} "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
