# Maintainer: Hao Zhang <theivorytower [at] gmail [dot] com> 
# Based on python2-postfix-policyd-spf PKGBUILD by Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python-postfix-policyd-spf
_pkgname=pypolicyd-spf
pkgver=1.3.1
_pkgver=1.3
pkgrel=1
pkgdesc="Python Postfix Sender Policy Framework (SPF) filter"
arch=('any')
url="https://launchpad.net/pypolicyd-spf/"
license=('GPL')
depends=('postfix' 'python-pyspf' 'python>=3.3')
optdepends=('python-authres: RFC 7001 Authentication-Results header support') 
conflicts=('python2-postfix-policyd-spf')
options=(!emptydirs)
backup=(etc/python-policyd-spf/policyd-spf.conf)
source=(https://launchpad.net/$_pkgname/$_pkgver/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('c847a4deecb7405ff4a6778fb971cbd1')
 
build() {
  cd "$srcdir/$_pkgname-$pkgver"
 
  python setup.py build || return 1
  }

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
  install -m644 policyd-spf.conf.commented $pkgdir/etc/python-policyd-spf || return 1
}

