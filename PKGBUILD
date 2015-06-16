# Maintainer: Sigmund Vestergaard <sigmundv at gmail dot com>
pkgname=python-eve-git
pkgver=0.5.r174.ge615518
pkgrel=1
pkgdesc="An open source Python REST API framework designed for human beings."
arch=('any')
url="http://python-eve.org/"
license=('BSD')
makedepends=('git' 'python-setuptools')
conflicts=('python-eve')
provides=('python-eve')
options=(!emptydirs)
source=("git+https://github.com/nicolaiarocci/eve.git")
_repname=eve
sha256sums=('SKIP')

pkgver() {
  cd "$_repname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_repname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
