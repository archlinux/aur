# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Thomas Haider <t.haider@vcnc.org>"
pkgname=rdiffweb
pkgver=0.7.0
pkgrel=2
pkgdesc="Web interface for browsing and restoring from rdiff-backup repositories."
arch=(any)
url="http://www.rdiffweb.org/wiki/index.php?title=Main_Page"
license=('GPL')
depends=('python2' 'python2-cherrypy' 'python2-pysqlite' 'python2-jinja' 'python2-setuptools' 'python2-babel' 'rdiff-backup')
optdepends=('pyopenssl: for https support')
source=("https://github.com/ikus060/$pkgname/archive/v$pkgver.tar.gz"
        "setup.py.patch"
        "$pkgname.service")
backup=('etc/rdiffweb/rdw.conf')
sha256sums=('0c374524f770e44af8a4176447a1cc4e6bb83bf8bac825275b90cd94e6119243'
            '52c796cb96a70184dbcab6de079fae87232e50f33f100ba83946764e85741de1'
            'cb70f474dabbcb9f1f52ffd11158ab66068e0edf6313589ee523524e796fb455')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 -i ../setup.py.patch

  python2 setup.py build
  python2 setup.py install --prefix=/usr --root="$pkgdir"

  install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim:set ts=2 sw=2 et:
