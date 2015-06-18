# Maintainer: Rich Li <rich@dranek.com>
# Contributor: Filip S. Adamsen <fsa [at] fsadev [dot] com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python2-pyspf
_pkgname=pyspf
pkgver=2.0.11
pkgrel=2
pkgdesc="Python 2 implementation of Sender Policy Framework (SPF)"
arch=('any')
url="http://bmsi.com/python/milter.html"
license=('Python')
depends=('python2-pydns' 'python2' 'python2-ipaddr')
checkdepends=('python2-yaml' 'python2-authres')
optdepends=('python2-authres: support Authentication-Results headers')
#conflicts=('python-pyspf')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('83add3a0d8732bcc28841ceb5da440ba')
sha1sums=('20935e09aba723c2c1423b34db27fb37485cf421')
sha256sums=('693e80df3d61d69daaa2590e0f2bc8167d5fa36ce373d43987984cb00ae23928')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

# While 2.0.8 passed tests, 2.0.9 fails six tests
#check() {
#  # Note that python2-authres, which is normally optional, is required for the tests to finish successfully
#  cd "$srcdir/$_pkgname-$pkgver/test"
#  # Use the SPF from this package, not the system-installed version
#  sed -i -e "s|import spf|sys.path.append('..')\nimport spf|" testspf.py
#  python2 testspf.py
#}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
