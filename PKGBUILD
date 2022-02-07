# Maintainer: xeruf <27jf at pm dot me>

_pkgname=rdictcc
pkgname=${_pkgname}-git
pkgver=r44.52f6b4b
pkgrel=1
pkgdesc="A Ruby translator using dictionary files from http://www.dict.cc, with tight Emacs integration"
arch=('any')
url="https://git.sr.ht/~tsdh/${_pkgname}"
license=('GPL3')
depends=('ruby' 'gdbm')
makedepends=('git')
source=("git+${url}")
sha512sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  sed -i "s#-<>]/, ' ').strip.split do |w|#<>-]/, ' ').strip.split do#" rdictcc.rb
  sed -i 's#rdictcc.rb#rdictcc#g' rdictcc.rb
  sed -i 's#/usr/local/bin/rdictcc.rb#/usr/bin/rdictcc#' rdictcc.el
  
  install -Dm755 rdictcc.rb "$pkgdir/usr/bin/rdictcc"
  install -Dm644 rdictcc.el "$pkgdir/usr/share/emacs/site-lisp/rdictcc.el"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/rdictcc/COPYING"
}

# vim:set ts=2 sw=2 et:
