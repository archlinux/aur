# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Gabriel Sabillon
# Contributors: Tsarev Nikita, LoranKey

# Set the following variable to true to use category icons instead of names
_category_icons=false

pkgname=mylaunchpad-git
_pkgname_simple=mylaunchpad
pkgdesc="Eyecandy Full Screen launcher script for openbox and other stand-alone window managers"
pkgrel=2
pkgver=r93.7bb98be

arch=('any')
url="https://github.com/gaboelnuevo/mylaunchpad"
license=('GPL')
depends=('python2-lxml' 'pygtk' 'cairo' 'python2-cairo' 'python2-imaging' 'gnome-menus2'
'python2-distutils-extra')
optdepends=('gtk-engine-murrine: murrine engine')
makedepends=('git')
provides=('mylaunchpad')
conflicts=('mylaunchpad')
md5sums=('SKIP')
backup=('etc/mylaunchpad.conf')

source=('mylaunchpad::git+http://github.com/gaboelnuevo/mylaunchpad')

pkgver() {
  cd "${srcdir}/${_pkgname_simple}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname_simple}"

  if [[ ${_category_icons} = true ]]; then
    git checkout category-icons
  fi

  python2 setup.py install --root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
