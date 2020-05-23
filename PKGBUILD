# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Bj?indeijer <bjorn@lindeijer.nl>

pkgname=lib32-enet
_pkgbasename=enet
pkgver=1.3.15
pkgrel=1
pkgdesc='A relatively thin, simple and robust network communication layer on top of UDP (32 bit)'
arch=('x86_64')
url='http://enet.bespin.org/'
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib')
source=("http://enet.bespin.org/download/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('41ce9bae1286e61cc2288d326c6571cce35be0fa5abf957c7a1386b785e4c6744b744792ac30c8318bfd11eae5aa4731430c973ffa6a09694bd0b0be8f8b4dae')

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
