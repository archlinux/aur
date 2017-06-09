# Maintainer: Fabian Beuke <mail@beuke.org>

_gitname=snaptile
_gitbranch=master
_gitauthor=jakebian
pkgname="${_gitname}-git"
pkgver=r20.e47358a
pkgrel=1
pkgdesc="Versatile, mouse-free window tiling for X11, with a 12 section grid system."
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=('python' 'python-gobject' 'python-xlib')
makedepends=('git')
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
  install -D -m755 snaptile.py ${pkgdir}/usr/bin/snaptile
  install -D -m755 window.py ${pkgdir}/usr/bin/window.py
  install -D -m755 keyutil.py ${pkgdir}/usr/bin/keyutil.py
  install -D -m644 License ${pkgdir}/usr/share/licenses/snaptile/LICENSE
}

# vim:set et sw=2 sts=2 tw=80:
