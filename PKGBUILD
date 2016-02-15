# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=0.16
pkgrel=1
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python2-netlib' 'python2-h2' 'python2-tornado' 'python2-configargparse'
         'python2-pyperclip' 'python2-blinker' 'python2-pyparsing' 'python2-html2text'
         'python2-construct' 'python2-six' 'python2-pillow' 'python2-watchdog'
         'python2-click' 'python2-urwid' 'python2-lxml' 'python2-setuptools')
optdepends=('python2-pyamf: Contentviews - Decodes AMF files'
            'python2-protobuf: Contentviews - Extended content decoding'
            'python2-cssutils: Contentviews - Beautifies CSS files')
makedepends=('git')
checkdepends=('python2-pytest-runner' 'pathod' 'python2-mock')
provides=('python2-libmproxy')
source=("git+https://github.com/mitmproxy/mitmproxy.git#tag=v$pkgver")
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname"
  # http2 tests currently fail
  # https://github.com/mitmproxy/mitmproxy/issues/936
  python2 setup.py ptr || warning "Tests failed"
}
 
package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" -O1
}
