# Maintainer: Harriet O'Brien <harrietobrien at protonmail dot com>
# Contributor: Clint Valentine <valentine dot clint at gmail dot com>
pkgname=genometools
pkgver=1.6.5
pkgrel=1
pkgdesc="A unified set of bioinformatics tools for analyzing genomes"
arch=('x86_64')
url="http://genometools.org/"
license=('ISC')
depends=('pango')
makedepends=('gcc-libs')
checkdepends=('ruby')
provides=('genometools')
conflicts=('genometools')
source=(https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('e6d2341210805c392a2d14181d40edeaf68f752044712caa002c810941f7eee69641a0864d8ea6ad33af72d8a9748787468b2d66c9e26da34b46a1b30758fbf6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix=/usr errorcheck=no
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install prefix="${pkgdir}"/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}"/usr/bin
  sed -i "s|${pkgdir}||g" genometools-config
  cd "${pkgdir}"/usr/include/genometools/
  sed -i "s|${srcdir}||g" gt_config.h
}
