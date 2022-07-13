# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=genometools
pkgver=1.6.2
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
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('dbce09fdd27c315d98707669386dbd8e')

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
