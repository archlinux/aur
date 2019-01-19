# Maintainer: Chris Lahaye <dev@chrislahaye.com>
pkgname=rtsp-server
pkgver=0.04.18.g4870105
pkgrel=1
pkgdesc='Lightweight RTSP/RTP streaming media server'
url='https://github.com/revmischa/rtsp-server'
arch=('any')
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-uri' 'perl-socket6' 'perl-anyevent' 'perl-moose' 'perl-moosex-getopt')
makedepends=('git')
source=('rtsp-server::git+https://github.com/revmischa/rtsp-server')
md5sums=('SKIP')
options=('!emptydirs')

sanitize() {
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
}

pkgver() {
  cd "$pkgname"
  sanitize

  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$pkgname"
  sanitize

  perl Makefile.PL
  make
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"
  sanitize

  make DESTDIR="$pkgdir" install
}
