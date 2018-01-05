# $Id: PKGBUILD 239226 2017-06-21 09:53:44Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Rubin Simons <rubin@xs4all.nl>

pkgname=trac
pkgver=1.2.2
pkgrel=1
pkgdesc="Trac Integrated SCM & Project Management using Apache & Subversion."
arch=('any')
url="http://trac.edgewall.org/"
license=('BSD')
depends=(python2 python2-genshi python2-babel python2-setuptools)
makedepends=(clearsilver)
install=trac.install
source=(http://ftp.edgewall.com/pub/trac/Trac-$pkgver.tar.gz
	license.txt
	tracd.service)
sha256sums=('5ddeca9d2d47093f5791ef7e38ec9aff9c911258b8ba94c85a32ccd9274fc3b6'
            'a0936aa2fab3714eb6a3e8ff64b730576d8a5f81340a0601f006c847761607c4'
            '3f050f1c9367b1b28e18a6ff0088f991676a9fbba3f5177859ce4db64f95ca42')

package() {
  cd "$srcdir"/Trac-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 "$srcdir"/license.txt "$pkgdir"/usr/share/licenses/trac/license.txt
  install -Dm0644 "$srcdir"/tracd.service "$pkgdir"/usr/lib/systemd/system/tracd.service
}
