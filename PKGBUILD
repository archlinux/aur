# Maintainer: Hao Zhang <theivorytower [at] gmail [dot] com> 
# Based on python2-postfix-policyd-spf PKGBUILD by Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir@eventualis.org>
pkgname=python-postfix-policyd-spf
_pkgname=pypolicyd-spf
pkgver=2.0.2
_pkgver=2.0
pkgrel=5
pkgdesc="Python Postfix Sender Policy Framework (SPF) filter"
arch=('any')
url="https://launchpad.net/pypolicyd-spf/"
license=('GPL')
depends=('postfix' 'python-pyspf' 'python>=3.3')
optdepends=('python-authres: RFC 7001 Authentication-Results header support') 
conflicts=('python2-postfix-policyd-spf')
options=(!emptydirs)
backup=(etc/python-policyd-spf/policyd-spf.conf)
source=(https://files.pythonhosted.org/packages/bc/f5/746dfe3f9a4420b9d038e832930f73e604d45a6ecc503c4193714459a92d/pypolicyd-spf-2.0.2.tar.gz)
md5sums=('cc50281cc13a8984de058ddc5ae8dcaf')
 
build() {
  cd "$srcdir/$_pkgname-$pkgver"
 
  python setup.py build || return 1
  }

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
  install -m644 policyd-spf.conf.commented $pkgdir/etc/python-policyd-spf || return 1
}

