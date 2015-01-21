# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=uritools
pkgname=("python-${_pkgname}-git" "python2-${_pkgname}-git")
pkgver=0.11.0.r0.g7816d9b
pkgrel=1
pkgdesc='RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse'
arch=('any')
url="https://github.com/tkem/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("python-${_pkgname}")
conflicts=$provides
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

package_python-uritools-git() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d "$pkgdir/usr/share/doc/python-${_pkgname}/"
  install -pm644 CHANGES.rst README.rst "$pkgdir/usr/share/doc/python-${_pkgname}/"
  install -Dpm644 LICENSE "$pkgdir/usr/share/licenses/python-${_pkgname}/LICENSE"
}

package_python2-uritools-git() {
  depends=('python2' 'python2-ipaddress')
  provides=("python2-${_pkgname}")
  conflicts=$provides

  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -d "$pkgdir/usr/share/doc/python2-${_pkgname}/"
  install -pm644 CHANGES.rst README.rst "$pkgdir/usr/share/doc/python2-${_pkgname}/"
  install -Dpm644 LICENSE "$pkgdir/usr/share/licenses/python2-${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
