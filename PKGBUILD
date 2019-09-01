# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Rubin Simons <rubin@xs4all.nl>

pkgname=trac
pkgver=1.4
pkgrel=1
pkgdesc="Trac Integrated SCM & Project Management using Apache & Subversion."
arch=('any')
url="http://trac.edgewall.org/"
license=('BSD')
depends=(python2 python2-jinja python2-babel python2-setuptools)
install=trac.install
source=(https://download.edgewall.org/trac/Trac-$pkgver.tar.gz
	license.txt
	tracd.service)
sha256sums=('a1ef354488d77bbce2aea016996fb71c76faf5f848d8c787703bad0d5e0ee5b1'
            'a0936aa2fab3714eb6a3e8ff64b730576d8a5f81340a0601f006c847761607c4'
            '3f050f1c9367b1b28e18a6ff0088f991676a9fbba3f5177859ce4db64f95ca42')

package() {
  cd "$srcdir"/Trac-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 "$srcdir"/license.txt "$pkgdir"/usr/share/licenses/trac/license.txt
  install -Dm0644 "$srcdir"/tracd.service "$pkgdir"/usr/lib/systemd/system/tracd.service
}
