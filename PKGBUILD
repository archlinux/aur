# Maintainer: a821
# Contributor: Athemis <alexander.minges[at]googlemail[dot]com>
# Contributor: sauliusl

pkgname=bowtie
pkgver=1.3.1
pkgrel=1
pkgdesc="Alignment tool for short nucleotide sequences against long templates"
url="https://bowtie-bio.sf.net"
arch=('x86_64' 'i686')
license=('Artistic2.0')
depends=('python' 'perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BenLangmead/bowtie/archive/v${pkgver}.tar.gz")
sha256sums=('147d9fe9652f7c5f351bfc0eb012e06981986fb43bd6bdfe88a95c02eabc6573')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix=/usr DESTDIR="${pkgdir}" install

  install -Dm755 -t "${pkgdir}/usr/share/${pkgname}/scripts/" scripts/*.{pl,sh}
  install -Dm644 -t "${pkgdir}/usr/share/doc/$pkgname/" MANUAL{,.markdown} TUTORIAL AUTHORS NEWS
}

# vim:set ts=2 sw=2 et:
