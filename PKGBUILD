# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=trac-svn
pkgver=1.6.r17694
pkgrel=1
pkgdesc='Enhanced wiki and issue tracking system for software development projects, SVN version'
arch=('any')
url="https://trac.edgewall.org/"
license=('BSD')
depends=(python python-jinja python-setuptools)
makedepends=(subversion python-babel)
optdepends=('python-psycopg2: PostgreSQL database support'
            'python-pygments: Syntax highlighting'
            'python-docutils: reStructuredText support'
            'python-babel: localization support'
            'python-pytz: complete list of time zones')
provides=(trac)
conflicts=(trac)
source=('trac::svn+https://svn.edgewall.org/repos/trac/trunk/')
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/trac"
	local ver=$(sed -n '/^version\s*=\s*/s/^version\s*=\s*//p' < setup.cfg)
	local rev=$(svnversion)
	printf "%s.r%s" "$ver" "${rev//[[:alpha:]]}"
}

package() {
	cd "$srcdir/trac"
	python setup.py install --prefix=/usr --root="$pkgdir"
	install -D -m644 COPYING "$pkgdir"/usr/share/licenses/trac/COPYING
}
