# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=fastahack
pkgver=1.0.0
pkgrel=2
pkgdesc="utilities for indexing and sequence extraction from FASTA files"
arch=('x86_64')
url='https://github.com/ekg/fastahack'
depends=('glibc' 'gcc-libs')
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/ekg/fastahack/archive/refs/tags/v${pkgver}.tar.gz)

sha512sums=('f7185a9d963f7a08d4d75bba46466fb964dfa8ed28096b6271bb1910ed0c96b937db9119869233b732f546933e04f8e258ab253a5904b3a0905423c1ceef20c5')


build() {
   cd ${pkgname}-${pkgver}
   export LDFLAGS="-Wl,-O2,--sort-common,--as-needed,-z,relro,-z,now"
   export PREFIX=/usr
   make LDFLAGS="$LDFLAGS"
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
}
