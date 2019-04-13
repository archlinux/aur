# Contributor: ordoban <dirk.langer@vvovgonik.de>

pkgname='perl-plack-test-agent'
pkgver='1.4'
pkgrel='2'
pkgdesc="OO interface for testing low-level Plack/PSGI apps"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')


# === Configure Requires ===
#
#     Module              Want Have
#     ------------------- ---- ----
#     ExtUtils::MakeMaker  any 7.34
#
# === Build Requires ===
#
#     Module              Want Have
#     ------------------- ---- ----
#     ExtUtils::MakeMaker  any 7.34
#

# === Runtime Requires ===
#
#     Module                Want    Have
#     --------------------- ---- -------
#     HTTP::Message::PSGI    any   undef
#     HTTP::Request::Common  any    6.18
#     HTTP::Response         any    6.18
#     Plack::Loader          any   undef
#     Plack::Util::Accessor  any   undef
#     Test::TCP              any    2.17
#     Test::WWW::Mechanize   any missing
#     parent                 any   0.236
#     strict                 any    1.11
#     warnings               any    1.42

depends=(
  'perl'
  'perl-http-message'
  'perl-plack'
  'perl-test-tcp'
  'perl-test-www-mechanize'
)

# === Test Requires ===
#
#     Module                     Want       Have
#     -------------------------- ---- ----------
#     ExtUtils::MakeMaker         any       7.34
#     File::Spec                  any       3.74
#     HTTP::Cookies               any       6.04
#     HTTP::Server::Simple::PSGI  any       0.16
#     IO::Handle                  any       1.39
#     IPC::Open3                  any       1.20
#     Modern::Perl                any 1.20170117
#     Plack::Request              any     1.0047
#     Test::Memory::Cycle         any       1.06
#     Test::More                 0.88   1.302162
#     Test::Requires              any       0.10
#     open                        any       1.11
#     utf8                        any       1.21
#
# === Test Recommends ===
#
#     Module         Want     Have
#     ---------- -------- --------
#     CPAN::Meta 2.120900 2.150010

checkdepends=(
  'perl'
  'perl-http-cookies'
  'perl-http-server-simple-psgi'
  'perl-modern-perl'
  'perl-plack'
  'perl-test-memory-cycle'
  'perl-test-more'
  'perl-test-requires'
)
makedepends=()
url='https://metacpan.org/pod/Plack::Test::Agent'
source=('https://cpan.metacpan.org/authors/id/O/OA/OALDERS/Plack-Test-Agent-1.4.tar.gz')
md5sums=('c80719269653dabb64d3603f4be97add')
sha512sums=('20593f0e7f789198ea28eb1df250b4950c42a0c5e74ecbd620452261fd2a2cd895300deefaabf82a595efbe00ffb13145ba8875b908594ce7a489b737f7b0613')
_distdir="Plack-Test-Agent-1.4"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
