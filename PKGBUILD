# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sunrise-commander-addons  
pkgver=450
pkgrel=1
pkgdesc="Addons for Sunrise Commander"
url="http://www.emacswiki.org/emacs/Sunrise_Commander"
arch=('any')
license=('GPL')
depends=('sunrise-commander')
_emacs_major_version=$(emacs --version | head -1|cut -b 11,12)
source=(http://www.emacswiki.org/emacs/download/sunrise-x-buttons.el \
  http://www.emacswiki.org/emacs/download/sunrise-x-mirror.el \
  http://www.emacswiki.org/emacs/download/sunrise-x-popviewer.el \
  http://www.emacswiki.org/emacs/download/sunrise-x-loop.el \
  http://www.emacswiki.org/emacs/download/sunrise-x-modeline.el \
  http://www.emacswiki.org/emacs/download/sunrise-x-tree.el \
  http://www.emacswiki.org/emacs/download/sunrise-x-checkpoints.el \
  http://www.emacswiki.org/emacs/download/sunrise-x-old-checkpoints.el)
md5sums=('3610706ebba2be295e498bb30dc5340f'
         '13998f92ac08971d27543695102fe987'
         '7262bbe97aca0049f1d0a322671f0362'
         '4e98bf38e217a1670d75238e75a457b0'
         '8d767281bde86e08c944b7b10fa15fa9'
         '1fe5a256be98fdc198129d7fa86f5ef6'
         'b1dc01e7cbde2125be8d61193e4e41f5'
         '62790fa0a747e40f31a5ed8b960c6a50')

build() {
  cd "$srcdir"
  if [ ${_emacs_major_version} == 22 ]; then
    rm sunrise-x-checkpoints.el
  else
    rm sunrise-x-old-checkpoints.el
  fi
  for _i in *.el
  do
    emacs --batch -q -f batch-byte-compile ${_i}
  done 
}
package() {
  install -d $pkgdir/usr/share/emacs/site-lisp
  cd "$srcdir"
  for _i in *.el
  do
    install ${_i} $pkgdir/usr/share/emacs/site-lisp/${_i}
    install ${_i}c $pkgdir/usr/share/emacs/site-lisp/${_i}c
  done
}
