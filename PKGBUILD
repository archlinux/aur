# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Thomas Haider <t.haider@vcnc.org>"
pkgname=rdiffweb
pkgver=0.10.4
pkgrel=1
pkgdesc="Web interface for browsing and restoring from rdiff-backup repositories."
arch=(any)
url="http://www.rdiffweb.org/wiki/index.php?title=Main_Page"
license=('GPL')
depends=('python2' 'python2-cherrypy' 'python2-pysqlite' 'python2-jinja' 'python2-setuptools' 'python2-babel' 'python2-future' 'rdiff-backup')
optdepends=('pyopenssl: for https support')
source=("https://github.com/ikus060/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.service")
install=rdiffweb.install
backup=('etc/rdiffweb/rdw.conf')
sha256sums=('09a70ef812a12da8376a3a5f687c8e053408a18b4757c05736ee4797cc337bad'
            '0e17c15c1cb8b6f12e98e9b28b8083f62371a5284a68a626bb14266129ec193d')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim:set ts=2 sw=2 et:
