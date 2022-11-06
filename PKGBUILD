# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Michael Straube <michael.straubej@gmail.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=galois
pkgver=0.8
pkgrel=1
pkgdesc='A falling blocks game with blocks of various shapes and sizes'
arch=('x86_64' 'aarch64')
url="https://www.nongnu.org/galois"
license=('GPL3')
depends=('gtkmm3' 'libxml++')
source=("https://download.savannah.gnu.org/releases/$pkgname/source/$pkgname-$pkgver.tar.gz"
        "galois-0.8-install-path.patch"
        "galois-0.8-libxml++3.0.patch")
sha512sums=('3285ec05831fb4e5bbf48809aab8c5a36c3ee22534de37fef94b5a390d64c4912d0b1d0c4cd567a1815d057454f821487cdb865ad625aba0ee37dbf5c1cd660e'
            '5f35dcdbd113441ac64637576c973dc5b2bab772ee058f4fa061b2ba500c36e02db383dc919d4be9077e1dfba258cd51620e484763a367f3f979766f24c213a0'
            'b8ca1a9dd34f9e74b377bd413837d438515f65a205795307e09f462df2c7241dc1ea46e518b6225792618f35313c43712964a65ef5ab469de5f99a0512cd3aa3')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../galois-0.8-install-path.patch
  patch -Np1 -i ../galois-0.8-libxml++3.0.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="${pkgdir}" install
}
