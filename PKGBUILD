# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=uritools
pkgname="python-${_pkgname}-git"
pkgver=4.0.0.r0.g0f20688
pkgrel=1
pkgdesc='RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse'
arch=('any')
url="https://github.com/tkem/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d "$pkgdir/usr/share/doc/python-${_pkgname}/"
  install -pm644 CHANGELOG.rst README.rst "$pkgdir/usr/share/doc/python-${_pkgname}/"
  install -Dpm644 LICENSE "$pkgdir/usr/share/licenses/python-${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
