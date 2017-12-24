# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=qt5-webengine-dict-en
pkgver=20171201
_pkgver=2017-12-01
_kapkgver=2017-08-24
pkgrel=1
pkgdesc="English dictionaries for qt5-webengine"
arch=('any')
url="https://github.com/marcoagpinto/aoo-mozilla-en-dict"
license=('LGPL')
depends=('qt5-webengine')
source=("${url}/releases/download/${_pkgver}gb/${_pkgver}gb.zip"
        "${url}/releases/download/${_kapkgver}us/${_kapkgver}us.zip"
        "${url}/releases/download/${_kapkgver}ca/${_kapkgver}ca.zip"
        "${url}/releases/download/${_kapkgver}au/${_kapkgver}au.zip")

sha1sums=('02b8470da9b3d7a74f71c46a6dcb1cb1926525de'
          '622dbed8140a7673c1707c1f2cef797ef206ac24'
          '96c98f6ba7305a2b92fbd3e1555160934e5881d4'
          'e69d2b7add22e5ce606d79bf305d20afca5993ff')

build() {
  cd "$srcdir"
  for i in *.dic; do
    qwebengine_convert_dict $i ${i%.dic}.bdic;
  done
  mv en-GB.bdic en_GB.bdic
}

package() {
  cd "$srcdir"
  for d in *.bdic; do
    install -Dm644 $d "$pkgdir"/usr/share/qt/qtwebengine_dictionaries/$d;
  done
  for r in README*.txt; do
    install -Dm644 $r "$pkgdir"/usr/share/doc/$pkgname/$r;
  done
}
