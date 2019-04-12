# Maintainer: Dirk Langer <dirk.langer@vvovgonik.de>

pkgname='perl-lwp-consolelogger'
pkgver='0.000039'
pkgrel='1'
pkgdesc="LWP tracing and debugging"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')

#
# === Runtime Requires ===
#
#     Module                           Want     Have
#     ---------------------------- -------- --------
#     Class::Method::Modifiers          any     2.12
#     Data::Printer                    0.36  missing
#     DateTime                          any     1.50
#     HTML::Restrict                    any    2.1.9
#     HTTP::Body                        any     1.22
#     HTTP::CookieMonster               any  missing
#     JSON::MaybeXS                1.003005 1.004000
#     LWP::UserAgent                    any     6.38
#     List::AllUtils                    any     0.15
#     Log::Dispatch                    2.56     2.68
#     Module::Load::Conditional         any     0.68
#     Moo                               any 2.003004
#     MooX::StrictConstructor           any  missing
#     Parse::MIME                       any  missing
#     Ref::Util                         any  missing
#     String::Trim                      any  missing
#     Sub::Exporter                     any    0.987
#     Term::Size::Any                   any  missing
#     Text::SimpleTable::AutoWidth     0.09  missing
#     Try::Tiny                         any     0.30
#     Types::Common::Numeric            any 1.004002
#     Types::Standard                   any 1.004002
#     URI::Query                        any  missing
#     URI::QueryParam                   any     1.76
#     XML::Simple                       any     2.25
#
# === Runtime Recommends ===
#
#     Module                 Want    Have
#     ---------------------- ---- -------
#     HTML::FormatText::Lynx   23 missing

depends=(
  'perl>=5.10'
  'perl-class-method-modifiers'
  'perl-data-printer>=0.36'
  'perl-datetime'
  'perl-html-restrict'
  'perl-http-body'
  'perl-http-cookiemonster'
  'perl-json-maybexs>=1.003005'
  'perl-libwww'
  'perl-list-allutils'
  'perl-log-dispatch>=2.56'
  'perl-module-load-conditional'
  'perl-moo'
  'perl-moox-strictconstructor'
  'perl-parse-mime'
  'perl-ref-util'
  'perl-string-trim'
  'perl-sub-exporter'
  'perl-term-size-any'
  'perl-text-simpletable-autowidth>=0.09'
  'perl-try-tiny'
  'perl-type-tiny'
  'perl-uri-query'
  'perl-uri'
  'perl-xml-simple'
)

#
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

makedepends=(
  'perl-extutils-makemaker'
)


# === Test Requires ===
#
#     Module                                Want     Have
#     ------------------------------------ ----- --------
#     Capture::Tiny                          any     0.48
#     ExtUtils::MakeMaker                    any     7.34
#     File::Spec                             any     3.74
#     HTML::FormatText::WithLinks            any  missing
#     HTTP::CookieJar::LWP                   any  missing
#     HTTP::Request                          any     6.18
#     Log::Dispatch::Array                   any    1.003
#     Path::Tiny                             any    0.108
#     Plack::Handler::HTTP::Server::Simple 0.016     0.16
#     Plack::Test                            any    undef
#     Plack::Test::Agent                     any  missing
#     Test::FailWarnings                     any    0.008
#     Test::Fatal                            any    0.014
#     Test::LWP::UserAgent                   any  missing
#     Test::More                             any 1.302162
#     Test::Most                             any     0.34
#     Test::Needs                            any 0.002006
#     Test::RequiresInternet                 any  missing
#     URI::file                              any     4.21
#     WWW::Mechanize                         any     1.90
#     version                                any   0.9923
#
# === Test Recommends ===
#
#     Module         Want     Have
#     ---------- -------- --------
#     CPAN::Meta 2.120900 2.150010
checkdepends=(
  'perl-capture-tiny'
  'perl-extutils-makemaker'
  'perl-html-formattext-withlinks'
  'perl-http-cookiejar'
  'perl-http-message'
  'perl-log-dispatch-array'
  'perl-path-tiny'
  'perl-http-server-simple-psgi>=0.016'
  'perl-plack'
  'perl-plack-test-agent'
  'perl-test-failwarnings'
  'perl-test-fatal'
  'perl-test-lwp-useragent'
  'perl-test-most'
  'perl-test-needs'
  'perl-test-requiresinternet'
  'perl-uri'
  'perl-version'
  'perl-www-mechanize'
)

url='https://metacpan.org/pod/LWP::ConsoleLogger'
source=("https://cpan.metacpan.org/authors/id/O/OA/OALDERS/LWP-ConsoleLogger-$pkgver.tar.gz")
md5sums=('73b2de2d82f00942bec92fc5f6d1028b')
sha512sums=('d3d160f26938d966ac1c3044e410c8c5e8016265cda121738a68ea3e66d6a0bd52cda1f00b2e5d2a59c486274333264853f9548c37f214061ffbdb244b241796')
_distdir="LWP-ConsoleLogger-$pkgver"

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
