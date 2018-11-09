# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Xavius <xavierelf@gmail.com>

pkgname=lib32-portaudio
pkgver=190600_20161030
pkgrel=2
pkgdesc='A free, cross-platform, open source, audio I/O library. (32 bit)'
arch=('x86_64')
url="http://www.portaudio.com/"
license=('custom')
depends=('lib32-alsa-lib' 'lib32-jack' "${pkgname#*-}")
makedepends=('gcc-multilib')
source=("http://www.portaudio.com/archives/pa_stable_v${pkgver}.tgz")
sha256sums=('f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513')

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
