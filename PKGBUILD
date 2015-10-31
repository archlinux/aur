# Maintainer: David Manouchehri <manouchehri@riseup.net>

_gitname='mimerender'
pkgname="python2-${_gitname}-git"
_gitbranch='master'
_gitauthor='martinblech'
pkgver=v0.5.5.r2.g62da8bb
pkgrel=1
pkgdesc=""
url="https://github.com/${_gitauthor}/${_gitname}"
license=('BSD')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
conflicts=("${_gitname}")
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
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set et sw=2 sts=2 tw=80: