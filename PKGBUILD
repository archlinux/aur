# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Bj?indeijer <bjorn@lindeijer.nl>

pkgname=lib32-enet
_pkgbasename=enet
pkgver=1.3.17
pkgrel=1
pkgdesc='A relatively thin, simple and robust network communication layer on top of UDP (32 bit)'
arch=('x86_64')
url='http://enet.bespin.org/'
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib')
source=("http://enet.bespin.org/download/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('efa0cb093a6ca295e5012a4fdebc5ffd6516a66a967e97b386b72781b18ce4a118c9bf94e87adbbdcd0ed441e22c62a05c24ff39fd6b475919e8efe9ab4715e4')

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
