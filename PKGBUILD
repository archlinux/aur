# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: max.bra <max dot bra at alice dot it>
# Contributor: Shanto <shanto at hotmail>

_pkgname=cardapio
pkgname=${_pkgname}-bzr
pkgver=886
pkgrel=2
pkgdesc="An alternative Gnome menu, launcher, and much more!"
arch=('i686' 'x86_64')
url="https://launchpad.net/cardapio"
license=('GPL3')
conflicts=('cardapio')
provides=('cardapio')
depends=('python2-xdg' 'xdg-user-dirs' 'python2-dbus' 'python2-gnomedesktop' 'python2-keybinder2' 'python2-simplejson' 'gnome-control-center' 'tk')
makedepends=('bzr')
optdepends=('tracker: search capability')
source=('cardapio::bzr+https://launchpad.net/cardapio/trunk'
        'arch_and_python_stuff.patch'
        'xdg_fix.patch')

pkgver() {
  cd "${_pkgname}"
  printf "%s" "$(bzr revno)"
}

prepare() {
  msg "Arch and Python2 adjustments..."
  cd "${srcdir}/${_pkgname}"
  patch -uNp2 -r- -i ../arch_and_python_stuff.patch || return 1
  patch -uNp2 -r- -i ../xdg_fix.patch || return 1
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/share/locale/cardapio.pot 
}

sha256sums=('SKIP'
            '3fdaae9f4248c10d665492fb85f018d22d1a7120c65a1491efe58a2437bb98d0'
            '7c9915154d57c50724a5670b4dd4bb831f89208225690c3a0bcc039b60eefea3')
