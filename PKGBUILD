# Maintainer: robertfoster
pkgname=smpq
pkgver=1.6
pkgrel=4
pkgdesc="StormLib MPQ archiving utility. Designed for full manipulating with Blizzard MPQ archives"
arch=('i686' 'x86_64')
url="https://launchpad.net/smpq"
license=('GPL3')
depends=('bzip2' 'stormlib' 'zlib')
makedepends=('cmake')
source=("https://launchpad.net/smpq/trunk/${pkgver}/+download/smpq_${pkgver}.orig.tar.gz"
  fix-smpq-compilation.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i ../fix-smpq-compilation.patch
  if [ ! -d build ]; then
    mkdir build
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd build
  cmake -DWITH_KDE=OFF \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname-$pkgver"
  cd build
  make DESTDIR="$pkgdir/" install
}

sha256sums=('b5d2dc8a5de8629b71ee5d3612b6e84d88418b86c5cd39ba315e9eb0462f18cb'
            'd44236b0dd48ff0d07a277d7c2cd5d8ba4c41903dd2c0de6beb814fa142d060a')
