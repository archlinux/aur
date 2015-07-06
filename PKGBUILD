# Maintainer: Athemis <alexander.minges[at]googlemail[dot]com>
# Contributor: sauliusl
pkgname=bowtie
pkgver=1.1.1
pkgrel=1
pkgdesc="Bowtie is an alignment tool for short nucleotide sequences against long templates"
url="http://bowtie-bio.sf.net"
arch=('x86_64' 'i686')
license=('PerlArtistic')
depends=()
source=("http://downloads.sourceforge.net/bowtie-bio/${pkgname}-${pkgver}-src.zip"
        "makefile_uname.patch")
sha256sums=('92aacb2d32065ebee433ce76eff673c24ed12591eb6c20e22ad7e4a790c48f72'
            '6b77e333a3ef10e3f787fd2983afd69cdb48e82347fc3316510c2ba5639742a3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np0 -i ../makefile_uname.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm755 bowtie ${pkgdir}/usr/bin
  install -Dm755 bowtie-build* ${pkgdir}/usr/bin
  install -Dm755 bowtie-inspect* ${pkgdir}/usr/bin
  install -Dm755 bowtie-align* ${pkgdir}/usr/bin
  install -Dm755 scripts/* ${pkgdir}/usr/bin
  install -Dm644 doc/* ${pkgdir}/usr/share/doc/${pkgname}
  install -Dm644 TUTORIAL "${pkgdir}/usr/share/doc/${pkgname}/TUTORIAL"
  install -Dm644 MANUAL "$pkgdir/usr/share/doc/$pkgname/MANUAL"
  install -Dm644 MANUAL.markdown "$pkgdir/usr/share/doc/$pkgname/MANUAL.markdown"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
