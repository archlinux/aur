#PKGBUILD Maintainer: Rafael Reggiani Manzo <rr.manzo#gmail.com>

pkgname=analizo
pkgver=1.18.1
pkgrel=2
pkgdesc="Analizo is a free, multi-language, extensible source code analysis and visualization toolkit."
groups=('analizo')
arch=('any')
url="http://analizo.org"
license=('GPLv3')
depends=('perl' 'perl-cpanplus-dist-arch' 'sloccount' 'doxyparse'
         'perl-app-cmd' 'perl-chi' 'perl-class' 'perl-data-uuid'
         'perl-digest-jhash' 'perl-list-moreutils' 'perl-file-homedir'
         'perl-file-copy-recursive' 'perl-getopt-euclid' 'perl-graph'
         'perl-list-compare' 'perl-mro-compat' 'perl-file-sharedir-install'
         'perl-params-util' 'perl-params-validate' 'perl-test-class'
         'perl-test-exception' 'perl-yaml')
makedepends=('git')
source=("${url}/download/${pkgname}_${pkgver}.tar.xz")
sha512sums=('2184796a58a0d8ffe52c8dcb551c620986194926437ea99ab18cad6a014346b766bec26f6848579051686ac1562c50ab19d5d164afe6c4ec78ebe958d0ee4a9c')

build(){
  cd "${srcdir}/${pkgname}"

  #Perl modules
  cpanp -i --skiptest Statistics::Descriptive # Looks like there is no Oficial or AUR candidate
  cpanp -i --skiptest Statistics::OnLine # Looks like there is no Oficial or AUR candidate
  cpanp -i --skiptest FindBin::libs # Looks like there is no Oficial or AUR candidate
  cpanp -i --skiptest Graph::Writer::DSM # Looks like there is no Oficial or AUR candidate

  #Analizo
  perl Makefile.PL
  make
}

package(){
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}/" install

  ln -s /usr/bin/site_perl/analizo ${pkgdir}/usr/bin/analizo
}