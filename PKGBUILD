# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Rubin Simons <rubin@xs4all.nl>

pkgname=trac
pkgver=1.2.3
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
sha256sums=('f373114d0be88f216c47ca31185238780cde898cd7256526a501e95007dd9f90'
            'a0936aa2fab3714eb6a3e8ff64b730576d8a5f81340a0601f006c847761607c4'
            '3f050f1c9367b1b28e18a6ff0088f991676a9fbba3f5177859ce4db64f95ca42')

package() {
  cd "$srcdir"/Trac-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 "$srcdir"/license.txt "$pkgdir"/usr/share/licenses/trac/license.txt
  install -Dm0644 "$srcdir"/tracd.service "$pkgdir"/usr/lib/systemd/system/tracd.service
}
