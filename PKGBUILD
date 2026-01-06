# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=agat
_pkgname=AGAT
pkgver=1.6.1
pkgrel=1
pkgdesc="Another Gtf/Gff Analysis Toolkit is a suite of tools to handle gene annotations in GTF/GFF format. doi:10.5281/zenodo.3552717"
arch=('any')
url='https://github.com/NBISweden/AGAT'
license=('GPL3')
depends=(
         'perl-bioperl'
         'perl-carp-clan'
         'perl-clone'
         'perl-file-share'
         'perl-file-sharedir'
         'perl-file-sharedir-install'
         'perl-graph'
	 'perl-libwww'
         'perl-lwp-protocol-https'
         'perl-lwp-useragent-determined'
         'perl-moose'
         'perl-sort-naturally'
         'perl-yaml-libyaml'
	 'perl-term-progressbar'
	 'perl-list-moreutils'
        )
source=($pkgname-$pkgver.tar.gz::https://github.com/NBISweden/AGAT/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('31bd66e9c4c9a3f9f231392289bcb8b53be6fe8e2fed322088b6ae91d423b6686022ceb0bb68b310ebbb665719544137fe48f24b07dc41f9a3b30a07877acdb6')
options=('!emptydirs' 'purge')

build() {
   cd $_pkgname-$pkgver
   perl Makefile.PL INSTALLDIRS=vendor

   make PREFIX="$pkgdir"/usr INSTALLDIR=${pkgdir}/usr/bin
}

package() {
  cd $_pkgname-$pkgver
  install -dm755  "$pkgdir"/usr/bin/vendor_perl

  make install DESTDIR="$pkgdir"
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}
