# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com> (spambayes PKGBUILD)
# Contributor: Felix Yan <felixonmars@archlinux.org> (spambayes PKGBUILD)
_pkgname='spambayes'
pkgname="$_pkgname-svn"
pkgver='1.1b1.3273'
pkgrel='1'
pkgdesc='Bayesian anti-spam classifier written in Python - svn version'
arch=('any')
url="http://$_pkgname.sourceforge.net/"
license=('PSF')
depends=('python2' 'python2-lockfile' 'python2-pydns' 'python2-setuptools')
makedepends=('subversion')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::svn+https://svn.code.sf.net/p/$_pkgname/code/trunk")
sha256sums=('SKIP')

_sourcedirectory="$pkgname/$_pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf '%s.r%s' "$(sed -nE 's/__version__ = "([^"]*)"/\1/p' "$_pkgname/__init__.py")" "$(svnversion)"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir"
}
