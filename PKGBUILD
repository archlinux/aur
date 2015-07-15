# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>
pkgname=rhythmbox-lastfmplaycount-git
pkgver=20121129
pkgrel=1
pkgdesc="A Rhythmbox plugin that fetches the currently playing track's playcount from Last.fm"
url="https://github.com/BramBonne/LastfmPlaycount"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git')
depends=('rhythmbox')

_plugin=lastfmplaycount
_gitroot="https://github.com/BramBonne/LastfmPlaycount.git"
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
