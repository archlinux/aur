# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=beets-follow
pkgname=${_pkgname}-git
pkgver=0.r16.f533f73
pkgrel=1
pkgdesc='Manage muspy subscriptions via beets.'
arch=('any')
url="https://github.com/nolsto/${_pkgname}"
license=('MIT')
depends=('python2' 'beets')
makedepends=('git')
provides=("$_pkgname")
conflicts=$provides
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  rm 'beetsplug/__init__.py'
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/${_pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
