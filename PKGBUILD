# Maintainer: Athemis <alexander.minges[at]googlemail[dot]com>
# Contributor: sauliusl
pkgname=bowtie
pkgver=1.2.2
pkgrel=1
pkgdesc="Bowtie is an alignment tool for short nucleotide sequences against long templates"
url="http://bowtie-bio.sf.net"
arch=('x86_64' 'i686')
license=('PerlArtistic')
depends=()
source=("https://github.com/BenLangmead/bowtie/archive/v${pkgver}_p1.tar.gz"
        "makefile_uname.patch")
sha256sums=('e1b02b2e77a0d44a3dd411209fa1f44f0c4ee304ef5cc83f098275085740d5a1'
            '6b77e333a3ef10e3f787fd2983afd69cdb48e82347fc3316510c2ba5639742a3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}_p1"
  patch -Np0 -i ../makefile_uname.patch
  make NO_TBB=1 EXTRA_CXXFLAGS="-std=c++03"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}_p1"
  make prefix=/usr DESTDIR="${pkgdir}" install
  install -d ${pkgdir}/usr/share/doc/${pkgname}
  find doc -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}" \;
  install -Dm644 TUTORIAL "${pkgdir}/usr/share/doc/$pkgname/TUTORIAL"
  install -Dm644 MANUAL "$pkgdir/usr/share/doc/$pkgname/MANUAL"
  install -Dm644 MANUAL.markdown "$pkgdir/usr/share/doc/$pkgname/MANUAL.markdown"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
