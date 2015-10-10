# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Achilleas Pipinellis <axilleas archlinux info>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

_gitname='pcapy'
pkgname="python2-${_gitname}-git"
_gitbranch='master'
_gitauthor='CoreSecurity'
pkgver=0.10.8.r9.g16d2df9
pkgrel=1
pkgdesc="A simplified object-oriented Python wrapper for libpcap"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('Apache') # Apache Version 1.1 (modified)
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