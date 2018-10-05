# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Bj?indeijer <bjorn@lindeijer.nl>

pkgname=lib32-enet
_pkgbasename=enet
pkgver=1.3.13
pkgrel=2
pkgdesc='A relatively thin, simple and robust network communication layer on top of UDP (32 bit)'
arch=('x86_64')
url='http://enet.bespin.org/'
license=('custom')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('gcc-multilib')
source=("http://enet.bespin.org/download/${_pkgbasename}-${pkgver}.tar.gz")
sha512sums=('82501c0248330a3a6bcac907907760e59b18cb662ebb42fe2c91e1557f1bc8ab452bf3fe7477dc01fa7a6e3b6124e1eb8eac46382d5bbebb2394879f9568b5df')

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
