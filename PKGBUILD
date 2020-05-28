# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

_pkgname='hamster-lib'
pkgname="python-$_pkgname-git"
_branch='develop'
pkgver=0.13.1.r20.gbc34c82
pkgrel=1
pkgdesc="A library for common timetracking functionality"
url="https://github.com/projecthamster/hamster-lib"
depends=('python' 'python-appdirs' 'python-future' 'python-icalendar' 'python-sqlalchemy' 'python-six')
makedepends=('python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('GPL3')
arch=('any')
source=("git://github.com/projecthamster/$_pkgname.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
	sed -i -e 's/find_packages()/find_packages(exclude=["tests"])/;s/.*configparser.*//g' setup.py
    sed -i -e 's!setup.py install!setup.py install --root="$(DESTDIR)"!g' Makefile
    make install DESTDIR="$pkgdir/"
}
