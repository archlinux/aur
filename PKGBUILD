# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=perl-mac-itunes-library
_perlname=Mac-iTunes-Library
pkgver=1.0
pkgrel=1
pkgdesc="Perl module for representing an iTunes library"
url="http://search.cpan.org/~dinomite/Mac-iTunes-Library-1.0/"
depends=('perl' 'perl-xml-parser' 'perl-extutils-makemaker')
arch=('i686' 'x86_64')
license=('perl-artistic')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/D/DI/DINOMITE/$_perlname-$pkgver.tar.gz") 
md5sums=('03042a25f92c8a669f67c7e32fe9d15a')

build() {
  cd "$srcdir"/$_perlname-$pkgver

  eval $(perl -V:archname)

  perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/${archname}

  make
}

package() {
  cd "$srcdir"/$_perlname-$pkgver

  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -print0 | xargs -0 rm -f
  find "$pkgdir" -name '*.pod' -print0 | xargs -0 rm -f
}

# vim:set ts=2 sw=2 et:
