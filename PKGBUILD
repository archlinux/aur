# Contributor: Vincent Bernardoff <vb@luminar.eu.org>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
# Contributor: Rick Chen <stuffcorpse@archlinux.us>
_base=tokyocabinet
pkgname=${_base}-git
pkgver=1.4.48.r20.g6d4cc70
pkgrel=1
pkgdesc="a modern implementation of DBM"
arch=('i686' 'x86_64' 'armv7h')
url="http://fallabs.com/${_base}"
license=(LGPL)
depends=(zlib bzip2)
makedepends=(gcc make pkgconfig git)
source=(git+https://github.com/Incubaid/${_base})
conflicts=(${_base})
provides=("${_base}=1.4.48")
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  ./configure --prefix=/usr --enable-off64
  make
}

# uncomment check routine if needed (can take ~5mins to run check)
# check() {
#  cd ${_base}
#  make -k check
# }

package() {
  cd ${_base}
  make DESTDIR="$pkgdir/" install
}
