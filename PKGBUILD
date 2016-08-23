# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python2-django-mailman3-git')
pkgver=r44.d0fa4f8
pkgrel=1
pkgdesc="Django library to help interaction with Mailman"
arch=(any)
makedepends=('git')
checkdepends=('python-tox')
depends=('python2' 'python2-django' 'python2-django-allauth'
         'python2-mailmanclient' 'python2-pytz' 'python2-django-gravatar')
url="https://gitlab.com/mailman/django-mailman3"
license=('GPLv3')
options=(!emptydirs)
source=("git+https://gitlab.com/mailman/django-mailman3.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/django-mailman3"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "${srcdir}/django-mailman3"
  tox -e py27-django110-head
}

package() {
  cd "$srcdir/django-mailman3"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
