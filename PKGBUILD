# Maintainer: Moritz Lipp <mlq@pwmt.org>
pkgname=radicale
pkgver=0.10
pkgrel=1
pkgdesc="A Simple Calendar Server"
arch=any
url="http://www.radicale.org/"
license=('GPL3')
depends=('python>=3.2')
backup=('etc/radicale/config')
install='radicale.install'
source=(
	http://pypi.python.org/packages/source/R/Radicale/Radicale-$pkgver.tar.gz
	radicale.service
  radicale.install
)
md5sums=('32655d8893962956ead0ad690cca6044'
         '62af2e07ad32a0fcece32fae68e92daf'
         '5613eec93efc5ef2ef68abd124fb6b61')
optdepends=(
  'python-pam: For PAM authentication' 
  'python-requests: For HTTP authentication'
  'python-ldap: For LDAP authentication'
  )

package() {
  cd "$srcdir/Radicale-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"

  install -m644 -D "$srcdir/Radicale-$pkgver/config" "$pkgdir/etc/radicale/config"
  install -m644 -D "$srcdir/radicale.service" "$pkgdir/usr/lib/systemd/system/radicale.service"

  install -m644 -D "$srcdir/Radicale-$pkgver/radicale.fcgi" \
    "$pkgdir/usr/share/$pkgname/radicale.fcgi"
  install -m644 -D "$srcdir/Radicale-$pkgver/radicale.wsgi" \
    "$pkgdir/usr/share/$pkgname/radicale.wsgi"
}
