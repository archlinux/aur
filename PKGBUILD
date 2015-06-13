# -*- shell-script -*-
# Contributor: Mikko Sysikaski  mikko.sysikaski at gmail dot com
# Updated by Stephen Diehl - sdiehl@clarku.edu
# Maintainer: Alastair Pharo  asppsa at gmail dot com
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure
pkgver=0.64
pkgrel=2
pkgdesc="Pure is a modern-style functional programming language based on term rewriting."
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="http://purelang.bitbucket.org/"
depends=('llvm35' 'gmp' 'mpfr' 'readline')
optdepends=("pure-docs: online documentation"
            "pcre: Perl regex support"
            "w3m: access to help in interactive mode"
            "emacs-pure-mode: editing Pure files from Emacs"
            "texmacs-pure: embedding Pure sessions in TeXmacs")
groups=(pure-complete pure-base)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('399b0a5cb6bbf0042ce42f9a857e332e')

build() {
  cd $srcdir/$pkgname-$pkgver
  # For Perl5 regex support, at present you still need to add --with-pcre
  # below (and make sure that you have pcre installed). This may become the
  # default in the future.
  ./configure --prefix=/usr --without-elisp --without-texmacs --enable-release
  make || return 1
  # check that the interpreter is working
  make check || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
