# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Achilleas Pipinellis <axilleas archlinux info>

_gitname='pypcap'
pkgname="python2-${_gitname}-git"
_gitbranch='master'
_gitauthor='pynetwork'
pkgver=v1.1.3.r4.ga6a2f14
pkgrel=1
pkgdesc="A simplified object-oriented Python wrapper for libpcap"
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
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set et sw=2 sts=2 tw=80: