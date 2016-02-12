# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-postorius-git')
_pkgbase=postorius
pkgver=r982.7b1f170
pkgrel=1
pkgdesc="A Django app that provides a web user interface to access GNU Mailman"
arch=(any)
provides=('python2-django-postorius')
conflicts=('python2-django-postorius')
makedepends=('git' 'python2-setuptools')
checkdepends=('python-tox')
depends=('python2' 'python2-django' 'python2-django-browserid' 'python2-mailmanclient')
url="https://gitlab.com/mailman/postorius"
license=('LGPL')
options=(!emptydirs)
source=("git+https://gitlab.com/mailman/postorius.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/postorius"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$srcdir/postorius"
  tox -e py27-django19
}

package() {
  cd "$srcdir/postorius"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
