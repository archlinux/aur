# Maintainer: Jesse R. Adams <jesse -at- techno -dash- geeks -dot- org>
pkgname=rainbarf-git
pkgver=20140404
pkgrel=1
pkgdesc="CPU/RAM stats chart for tmux & screen"
url="http://freecode.com/projects/rainbarf"
arch=('i686' 'x86_64' 'arm')
license=('GPL')
#depends=()
optdepends=('tmux' 'screen')
makedepends=('git')
provides=('rainbarf')
conflicts=('rainbarf')
source=()
md5sums=()
sha256sums=()

_gitroot="git://github.com/creaktive/rainbarf.git"
_gitname="rainbarf"

build() {
  cd $srcdir
  msg "Connecting to the git repository..."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"
}

package() {
  msg "Copying files..."
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_gitname}/rainbarf" "${pkgdir}/usr/bin/" || return 1
}
