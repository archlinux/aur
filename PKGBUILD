# Maintainer: Philipp Joram <phijor AT t-online DOT de>

_gitname='pefile'
pkgname="python-${_gitname}-git"
_gitauthor='stangelandcl'
pkgver=r93.5958343
pkgrel=1
pkgdesc="A simplified object-oriented Python wrapper for libpcap"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('MIT')
source=("git://github.com/${_gitauthor}/${_gitname}")
sha512sums=('SKIP')
arch=('any')
makedepends=('git' 'python-setuptools')
conflicts=("python2-${_gitname}-git")
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=2 sts=2 tw=80:
