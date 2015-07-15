# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (at) gmail.com>
# Contributor: alexwizard

pkgname=kdeplasma-applets-plasma-crystal-git
_realname=plasma-crystal
pkgver=20120109
pkgrel=1
pkgdesc="A widget that can be used as search widget, or alternative file-open mechanism"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=plasma-crystal.git&a=summary"
license=('GPL')
depends=('kdebase-plasma')
makedepends=('cmake' 'automoc4' 'git' 'docbook-xsl' 'bc')
provides=(kdeplasma-applets-${_realname})
conflicts=(kdeplasma-applets-${_realname})

_gitroot="git://anongit.kde.org/${_realname}"
_gitname=${_realname}
 
build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build
 
  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
