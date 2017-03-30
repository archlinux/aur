# Maintainer: Jan Tojnar <jtojnar@gmail.com>
pkgname=perl-app-sqitch
pkgver=0.9995
pkgrel=1
pkgdesc='Sane database change management'
_dist=App-Sqitch
arch=('any')
url="http://sqitch.org/"
license=('MIT')
depends=(
	'perl-clone'
	'perl-config-gitlike>=1.11'
	'perl-datetime'
	'perl-datetime-timezone'
	'perl-dbi'
	'perl-devel-stacktrace'
	'perl-encode-locale'
	'perl-file-homedir'
	'perl-hash-merge'
	'perl-libintl-perl'
	'perl-io-pager'
	'perl-ipc-run3'
	'perl-ipc-system-simple'
	'perl-list-moreutils'
	'perl-moo>=1.002000'
	'perl-namespace-autoclean>=0.16'
	'perl-path-class>=0.33'
	'perl-perlio-utf8-strict'
	'perl-string-formatter'
	'perl-string-shellquote'
	'perl-sub-exporter'
	'perl-template-tiny'
	'perl-throwable>=0.200009'
	'perl-try-tiny'
	'perl-type-tiny'
	'perl-type-tiny-xs'
	'perl-uri-db'
	'perl-uri'
	'perl>=5.11.0'
)

checkdepends=(
	'perl-capture-tiny'
	'perl-test-deep'
	'perl-test-file'
	'perl-test-mockmodule'
	'perl-test-nowarnings'
)

optdepends=(
	'perl-dbd-pg: PostgreSQL support'
	'perl-dbd-sqlite: SQLite support'
	'perl-dbd-mysql: MySQL support'
	'perl-dbd-firebird: Firebird support'
)

options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/$_dist-$pkgver.tar.gz")
sha512sums=('15681566b321fc3f7cd0d4aac817bac69cabae4655cdaff862e85dcc80db771adf512ad354f21102e8a760bc8b54d306050c9bfbcca34bf243ab6af7e497b9f3')

build() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
	/usr/bin/perl Build.PL
	./Build
}

check() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	./Build test
}

package() {
	cd "$srcdir/$_dist-$pkgver"
	unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
	./Build install --installdirs=vendor --destdir="$pkgdir"
}
