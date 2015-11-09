# Maintainer: Jenya Sovetkin <e dot sovetkin at gmail dot com>
pkgname=rdictcc-git
pkgver=r36.43192fc
pkgrel=1
pkgdesc="A dictionary / word translator written in Ruby. It uses the dictionaries you can fetch from http://www.dict.cc. RDictCc has a tight integration into Emacs."
arch=('any')
url="https://github.com/tsdh/rdictcc"
license=('GPL3')
depends=('ruby' 'gdbm')
makedepends=('git')
sha256sums=('SKIP')
source=('git+git://github.com/tsdh/rdictcc.git')

_gitroot=git://github.com/tsdh/rdictcc.git
_gitname=rdictcc

pkgver() {
  cd "${srcdir}/${_gitname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"

  sed -i "s#-<>]/, ' ').strip.split do |w|#<>-]/, ' ').strip.split do#" rdictcc.rb
  sed -i 's#rdictcc.rb#rdictcc#g' rdictcc.rb
  sed -i 's#/usr/local/bin/rdictcc.rb#/usr/bin/rdictcc#' rdictcc.el
  
  install -Dm755 rdictcc.rb "$pkgdir/usr/bin/rdictcc"
  install -Dm644 rdictcc.el "$pkgdir/usr/share/emacs/site-lisp/rdictcc.el"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/rdictcc/COPYING"
}

# vim:set ts=2 sw=2 et:
