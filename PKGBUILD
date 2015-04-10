# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=0.11.3
pkgrel=2
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
makedepends=('python2-setuptools')
depends=('python2-netlib' 'python2-pyasn1' 'python2-pyopenssl' 
         'python2-configargparse' 'python2-tornado'
         'python2-pyperclip' 'python2-blinker'
         'python2-urwid' 'python2-lxml' 'python2-pillow')
optdepends=('python2-pyamf: Contentviews - Decodes AMF files'
            'python2-protobuf: Contentviews - Extended content decoding'
            'python2-cssutils: Contentviews - Beautifies CSS files')
conflicts=('mitmproxy-git')
provides=('python2-libmproxy')
source=("http://mitmproxy.org/download/$pkgname-$pkgver.tar.gz")
sha256sums=('e774760fc33864caa708eeaafb756e110d7adeb619f3734f2f50b2a0e4910d5c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^#\!\/usr\/bin\/env python$/#\!\/usr\/bin\/env python2/' libmproxy/contrib/html2text.py
}
 
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
}
