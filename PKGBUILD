# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Bj?indeijer <bjorn@lindeijer.nl>

pkgname=lib32-enet
_pkgbasename=enet
pkgver=1.3.16
pkgrel=1
pkgdesc='A relatively thin, simple and robust network communication layer on top of UDP (32 bit)'
arch=('x86_64')
url='http://enet.bespin.org/'
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib')
source=("http://enet.bespin.org/download/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('79761749d0f127c30b3c7186ca3c73795532d2e96ac1c152cd1fb5ca422b020f75e0c08ef9c9744e16866f8e5261dc24985e0421be56bcb0a4b072411af425ae')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${_pkgbasename}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "$pkgdir"/usr/{share,include,bin}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
