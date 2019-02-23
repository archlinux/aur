# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Bj?indeijer <bjorn@lindeijer.nl>

pkgname=lib32-enet
_pkgbasename=enet
pkgver=1.3.14
pkgrel=1
pkgdesc='A relatively thin, simple and robust network communication layer on top of UDP (32 bit)'
arch=('x86_64')
url='http://enet.bespin.org/'
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib')
source=("http://enet.bespin.org/download/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('56011529c02ef085e57c77b7d6b72e5d0e76159ebf94a9980f50c2c8f7ef85a32a163e65d9414dda810fc2204e71c389745e7725a731371e2847a45bd4e18704')

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
