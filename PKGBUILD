# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sgmltools-lite
pkgver=3.0.3
pkgrel=9
pkgdesc="SGML processing tools (sucessor to the obsolete SGMLtools)"
arch=('any')
url="http://sgmltools-lite.sourceforge.net/"
license=('GPL')
depends=('jade' 'python2')
source=(https://downloads.sourceforge.net/sourceforge/sgmltools-lite/sgmltools-lite-${pkgver}.tar.gz
        datadir.diff)
sha512sums=('36709ba726859b734a7402c533ba7d2abc0546007bc97dba76ac824bc42f6f8ac7ef263b3740d0be51749cbc0982d010ba938646fca2006fa2c5094a296b3c81'
            '1086941a43e9610cd53b4647fab69c256b139589852be461ed56f3eb634eed73de2a13d00842bea22f669a2edc6cdc12f639b69bba73ef47ab3b78e57ca2a891')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  export PYTHON=/usr/bin/python2
  patch -p0 <"$srcdir"/datadir.diff
  find -type d -name CVS -exec rm -rf {} \; || true
  ./configure --prefix=/usr --mandir="$pkgdir"/usr/share/man
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make prefix="$pkgdir"/usr etcdir="$pkgdir"/etc/sgml install
}
