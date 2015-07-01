# Maintainer: Alain Kalker <a.c.kalker at gmail dot com>
pkgname=seascope
pkgver=0.8
pkgrel=1
pkgdesc="A multi-platform multi-language source code browsing tool"
arch=('any')
url="http://code.google.com/p/seascope/"
license=('BSD')
depends=('python2-qscintilla' 'ctags')
makedepends=('gendesk')
optdepends=('idutils: backend for C, lex, yacc, limited support for C++, Java'
            'cscope: backend for all languages supported by ctags'
            'global: backend for C, C++, Yacc, Java, PHP'
            'graphviz: generate class graphs')
provides=('seascope')
conflicts=('seascope')
options=(!emptydirs)
source=(http://seascope.googlecode.com/files/seascope-$pkgver.tar.gz)
md5sums=('133b4e5628a8c2340fb00d7c4e41b547')
_name=('Seascope')
_exec=('Seascope')

build() {
  cd "$srcdir/"
  ln -sf "$pkgname-$pkgver/src/icons/seascope.svg" "$pkgname.svg"
  gendesk -n
  cd "$pkgname-$pkgver"

  # Use python2
  find -type f -exec sed -i -e '/^#!/s/python$/python2/' {} \;
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  chmod +x "$pkgdir/usr/lib/python2.7/site-packages/Seascope/Seascope.py"
  install -m755 -d "$pkgdir/usr/bin"
  ln -s /usr/lib/python2.7/site-packages/Seascope/Seascope.py "$pkgdir/usr/bin/Seascope"
  install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
