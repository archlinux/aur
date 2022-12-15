# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=agat
_pkgname=AGAT
pkgver=1.0.0
pkgrel=1
pkgdesc="Another Gtf/Gff Analysis Toolkit: Suite of tools to handle gene annotations in any GTF/GFF format. https://www.doi.org/10.5281/zenodo.3552717"
arch=('any')
license=('GPL3')
depends=('perl-bioperl' 'perl-clone' 'perl-carp-clan' 'perl-sort-naturally' 'perl-yaml-libyaml' 'perl-lwp-protocol-https' 'perl-file-sharedir' 'perl-file-sharedir-install' 'perl-graph' 'perl-lwp-useragent-determined' 'perl-moose' 'perl-file-share')
url='https://github.com/NBISweden/AGAT'
source=($pkgname-$pkgver.tar.gz::https://github.com/NBISweden/AGAT/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('937b03f5f76afe0a190760046ab05f3c91b7a4582d2cde0053479659e7da460221d7051bd307e06239e5b5786f050eb7492ca4cc8744f022254ab9e3eb49c45a')

prepare() {
  cd $_pkgname-$pkgver 
  sed -i '51d' Makefile.PL #remove unneeded json dependency from makefile
}

build() {
   cd $_pkgname-$pkgver
   perl Makefile.PL INSTALLDIRS=vendor
   make PREFIX="$pkgdir"/usr INSTALLDIR=${pkgdir}/usr/bin
}

package() {
  cd $_pkgname-$pkgver
  install -d  "$pkgdir"/usr/bin/vendor_perl
  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
