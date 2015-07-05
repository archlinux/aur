# Maintainer: Jens Adam <jra@byte.cx>

_perlmod=Travel-Routing-DE-VRR
pkgname=perl-travel-routing-de-vrr
pkgver=2.10
pkgrel=1
pkgdesc='Unofficial efa.vrr.de command line client and Perl module'
url='http://finalrewind.org/projects/Travel-Routing-DE-VRR/'
license=('custom:WTFPL')
arch=('any')
depends=('perl-class-accessor' 'perl-exception-class' 'perl-libwww' 'perl-xml-libxml')
makedepends=('perl-file-slurp' 'perl-test-compile' 'perl-test-fatal' 'perl-test-pod')
options=('!emptydirs')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc}
        'http://www.wtfpl.net/txt/copying/COPYING')
md5sums=('4fa9429f9ab81a990e808dad517e0b7c'
         'a337bf4f904ffeea09447ecd9fb7808f'
         '8365d07beeb5f39d87e846dca3ae7b64')

build() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

check() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build test
}

package() {
  cd "${srcdir}"/${_perlmod}-${pkgver}
  ./Build install
  install -Dm644 ../COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -Dm644 provides/zsh/completions/_efa "${pkgdir}"/usr/share/zsh/site-functions/_efa
}
