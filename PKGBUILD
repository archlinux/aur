#Contributor: Zephyr
pkgname=oxygen-gtk3-git
pkgver=20130417_vgtk3_1.1.2_45_ge0b88
pkgrel=1
pkgdesc="Port of the default KDE widget theme (Oxygen) to GTK3"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-gtk"
license=('LGPL')
depends=('gtk3' 'dbus-glib')
makedepends=('git' 'cmake')
conflicts=('oxygen-gtk3')
provides=('oxygen-gtk3')
options=('!strip')
source=("git://anongit.kde.org/oxygen-gtk#branch=gtk3")
md5sums=('SKIP')

#_gitroot="git://anongit.kde.org/oxygen-gtk"
_gitname="oxygen-gtk"

pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always --abbrev=5 | sed 's/-/_/g')"
}

build() {
  #cd "${srcdir}"
  #msg "Connecting to GIT server...."

  #if [ -d ${_gitname} ] ; then
    #cd ${_gitname} && git pull origin
    #msg "The local files are updated."
  #else
    #git clone ${_gitroot} ${_gitname}
    #cd ${_gitname}
    #git checkout gtk3
    #cd -
  #fi

  #msg "GIT checkout done or server timeout"
  #msg "Starting make..."

  #rm -rf "${srcdir}/${_gitname}-build"
  #git clone -l "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  #cd "${srcdir}/${_gitname}-build"

  #cmake -DCMAKE_INSTALL_PREFIX=/usr \
        #-DCMAKE_BUILD_TYPE=debugfull \
        #../${_gitname}
  #make

  cd "${srcdir}/${_gitname}"
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=debugfull \
        ..

  make
}

package () {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR=${pkgdir} install
}
