# Maintainer: Ghabry <gabriel-aur mastergk de>

pkgname=minimap2
pkgver=2.17
pkgrel=1
pkgdesc="A versatile pairwise aligner for genomic and spliced nucleotide sequences"
arch=('i686' 'x86_64')
url="https://lh3.github.io/minimap2"
license=('MIT')
depends=('zlib')
source=("https://github.com/lh3/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('b68ac8882d33cc63e9e3246775062aeb159b6990ff7f38099172c3fe6f8a2742')

prepare() {
  cd $pkgname-$pkgver

  # add LDFLAGS
  sed -i 's/LIBS=/LIBS=$(LDFLAGS)/' Makefile
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  # application
  install -Dm0755 $pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -Dm0644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
