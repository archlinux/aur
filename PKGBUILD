# Maintainer: Kevin Lewis <aur AT kevin DOT oakaged DOT io>
_application=slinger
pkgname=gnome-shell-extension-${_application}-git
pkgrel=1
pkgver=r48.da9cda1
license=('unknown')
pkgdesc="gnome-shell extension for throwing windows around efficiently."
url="https://github.com/timbertson/slinger"
arch=('any')
depends=('gnome-shell')
makedepends=('git' 'typescript' 'python')
source=(
  "git+https://github.com/timbertson/${_application}"
)
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${_application}
  tools/gup compile
}

package() {
  _builddir=${srcdir}/${_application}/extension
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/slinger@gfxmonk.net"
  
  mkdir -p ${_destdir}
  cp -R ${_builddir}/* ${_destdir}
  rm ${_destdir}/schemas/gschemas.compiled
  cp -f ${_builddir}/schemas/gschemas.compiled ${_destdir}/schemas/gschemas.compiled
}

pkgver() {
  cd ${_application}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
