# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>
pkgname=rhythmweb-git
pkgver=20121202
pkgrel=1
pkgdesc="GTK3 port of the original rhythmweb v0.1x GTK2 plugin - for Rhythmbox v2.96 and above"
url="https://github.com/fossfreedom/rhythmweb"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox')
conflicts=('rhythmweb')
provides=('rhythmweb')
replaces=('rhythmweb')

_plugin=rhythmweb
_gitroot="https://github.com/fossfreedom/rhythmweb.git"
_gitname="rhythmbox-$_plugin"

build () {
  cd ${srcdir}
  msg "Connecting to the GIT server..."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
    cd ${_gitname}
  fi
  msg "GIT checkout done."
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}"
  cp * "${pkgdir}/usr/lib/rhythmbox/plugins/${_plugin}"
}
