# Maintainer: Luiz Amaral <email at luiz dot eng dot br>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Contributor: Charles Pigott <charlespigott@googlemail.com>

_perlmod=parse-debcontrol
_modnamespace=parse
pkgname=perl-$_perlmod
_perlname=Parse-DebControl
pkgver=2.005
pkgrel=5
pkgdesc="Easy OO parsing of debian control-like files"
arch=('any')
url="https://metacpan.org/module/Parse::DebControl"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-io-stringy' 'perl-exporter-lite')
makedepends=('perl-libwww' 'perl-error' 'perl-test-exception')
options=('!emptydirs')
source=("http://cpan.metacpan.org/authors/id/J/JA/JAYBONCI/$_perlname-$pkgver.tar.gz"
        '0001-Parse-DebControl-error-handling.patch'
        '0002-Strict-parse.patch'
        '0003-Parse-DebControl-Patch.patch'
        '0004-Manpage-spelling-fixes.patch'
        '0005-More-thorough-comment-parsing.patch'
        '0006-Better-line-number-tracking.patch')
sha256sums=('b64bce1ff212d7e3ef9d4368e7b62749cf27751fa8360cdf53e969123346a729'
            'dbee9a96466067e2fe27c93a5d27e31d5dc9e9e698adee9ed72c18d9f3345add'
            'f3473c89718b8463579668b2b8339f7a354e59c716bf200538232b4d69043b17'
            '4a3e2bea2b23df8766f40e80101be4a3716087cb4ce7e78cd433e2d68d12b2ff'
            '44067394d602adbcccc6a165502d5785f28b4938da00053db97972af4881734b'
            'e6c69a85d8d3fe7e48467b39710e8885cc4c184412b44f12675b0ecdf3116ce8'
            '07ec49ad7f7bfbefbdeebcbe98dbcad52318d44b4c8fb588769352489d1acc32')

prepare() {
  cd "$srcdir/$_perlname-$pkgver"
  patch --forward --strip=1 --input="$srcdir/0001-Parse-DebControl-error-handling.patch"
  patch --forward --strip=1 --input="$srcdir/0002-Strict-parse.patch"
  patch --forward --strip=1 --input="$srcdir/0003-Parse-DebControl-Patch.patch"
  patch --forward --strip=1 --input="$srcdir/0004-Manpage-spelling-fixes.patch"
  patch --forward --strip=1 --input="$srcdir/0005-More-thorough-comment-parsing.patch"
  patch --forward --strip=1 --input="$srcdir/0006-Better-line-number-tracking.patch"
}

build() {
  cd "$srcdir/$_perlname-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_perlname-$pkgver"
  make install DESTDIR="$pkgdir/"
}
