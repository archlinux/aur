# -*- shell-script -*-
# Maintainer: Alastair Pharo  asppsa at gmail dot com
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-pcre-hg
pkgver=5592.c229999c496e
pkgrel=1
pkgdesc="Pure is a modern-style functional programming language based on term rewriting (variant with Perl regex support)."
arch=("i686" "x86_64")
license=('GPL3' 'LGPL3')
url="http://purelang.bitbucket.org/"
depends=('llvm35' 'gmp' 'mpfr' 'pcre' 'readline')
makedepends=('mercurial')
optdepends=("pure-docs-hg: online documentation"
            "w3m: access to help in interactive mode"
            "emacs-pure-mode: editing Pure files from Emacs"
            "texmacs-pure: embedding Pure sessions in TeXmacs")
provides=('pure' 'pure-hg')
conflicts=('pure' 'pure-hg')
source=("hg+https://bitbucket.org/purelang/pure-lang")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pure-lang
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd $srcdir/pure-lang/pure
  autoreconf
  ./configure --enable-release --prefix=/usr --without-elisp --without-texmacs --with-pcre
  make || return 1
  make check || return 1
}

package() {
  cd "$srcdir/pure-lang/pure"
  make DESTDIR=$pkgdir install || return 1
}

# vim:set ts=2 sw=2 et:
