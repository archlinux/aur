# Maintainer: Aman Verma <amanraoverma at gmail dot com>
pkgname=ap-rename
pkgver=1.601
pkgrel=1
# This is not File::Rename from CPAN, which is what gets installed as prename when
# you run `apt install rename` on Debian.
pkgdesc='Perl-powered file rename script with many helpful built-ins'
arch=(any)
url='http://plasmasturm.org/code/rename'
license=('PerlArtistic')
depends=(perl)
source=("https://github.com/ap/rename/archive/v$pkgver.tar.gz")
sha384sums=('a3cc071fd4be319b0fc526d682bc920a6b1b03656356feb5a49fef4bd1881a919d82661eb5b7277cd66c448399d57181')

build() {
  cd "rename-$pkgver"
  pod2man --utf8 rename rename.1
}

check() {
  mkdir -p "rename-$pkgver/tests"
  cd "rename-$pkgver/tests"
  touch foo.doc bar.doc
  ../rename -s .doc .txt *.doc
  stat foo.txt bar.txt >/dev/null
}

package() {
  cd "rename-$pkgver"
  # Change name to "prename" to not conflict with util-linux.
  install -D -m644 rename.1 "$pkgdir/usr/share/man/man1/prename.1"
  install -D rename "$pkgdir/usr/bin/vendor_perl/prename"
}

# vim: shiftwidth=2 softtabstop=2 expandtab
