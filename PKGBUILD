# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=rebol
pkgver=2.7.8
pkgrel=3
pkgdesc="A cross-platform data exchange language and a multi-paradigm dynamic programming language"
arch=('i686' 'x86_64')
url="http://www.rebol.com/"
license=('custom:REBOL End User License')
groups=('devel')
makedepends=('wget')
provides=('rebol')
options=('!strip')

_source="http://www.rebol.com/downloads/v278/rebol-core-278-4-2.tar.gz"
_license="http://www.rebol.com/license.html"

if test "$CARCH" == x86_64; then
  depends+=(lib32-glibc)
fi

build(){
  _arc=$(basename $_source) 
  if [ ! -f $_arc ]; then
    wget $_source
  fi
  tar xvfz $_arc  
  if [ ! -f $(basename $_license) ]; then
    wget $_license
  fi
}

package() {
  install -Dm755 "$srcdir"/releases/rebol-core/rebol "$pkgdir"/usr/bin/rebol
  install -Dm644 "$srcdir"/license.html "$pkgdir"/usr/share/licenses/"$pkgname"/license.html
}

# vim:set ts=2 sw=2 et:
