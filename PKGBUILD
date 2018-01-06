# $Id: PKGBUILD 276082 2017-12-26 02:22:10Z eschwartz $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Todd Harbour <lefallen@quadronyx.com.au>

pkgname=xmpppy
pkgver=0.5.0_rc1
pkgrel=4
pkgdesc="A Python library to provide easy scripting with Jabber"
arch=('any')
url="http://xmpppy.sourceforge.net/"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
source=(https://downloads.sourceforge.net/project/xmpppy/xmpppy/${pkgver/_/-}/xmpppy-${pkgver/_/}.tar.gz
	ssl.patch)
md5sums=('e0d2b3f9e4a278c163431e64adb0c861'
         '516cb530837016c719a1116a1d6ad199')

prepare() {
  cd "$srcdir"/$pkgname-${pkgver/_/}
  patch -p1 <"$srcdir"/ssl.patch
}

build() {
  cd "$srcdir"/$pkgname-${pkgver/_/}
  python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-${pkgver/_/}
  python2 setup.py install --prefix=/usr --root="$pkgdir" install
}
