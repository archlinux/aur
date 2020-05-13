# Maintainer:     Ryan James <Ryan_James@linuxmail.org>	
# old-Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=qzdl
pkgver=3.3.0.0
pkgrel=1
pkgdesc="A ZDoom launcher using Qt"
arch=('x86_64' 'i686')
url="http://zdl.vectec.net"
license=('GPL')
depends=('qt5-base')
conflicts=('qzdl-git')
makedepends=('git' 'gdb' 'make')
source=("git://github.com/qbasicer/qzdl.git")
md5sums=("SKIP")
_gitname="qzdl"
_branch=master

build()
{
  cd "${srcdir}/${_gitname}"
  git checkout ${_branch}
  rm -rf "${srcdir}/${_gitname}-build"
  mkdir "${srcdir}/${_gitname}-build"
  ls -A | grep -v .git | xargs -d '\n' cp -r -t ../${_gitname}-build
  cd "${srcdir}/${_gitname}-build"
  # little fixup for the latest qt4 update
  # should be necessary until qbasicer actually updates the project
  # (last commit was around September 2012)
  # sed -si 's/qmake/qmake-qt5/g' configure configure.in
  cmake ../qzdl-build 
  make
}

package()
{
  cd "${srcdir}/${_gitname}-build"
  mkdir -p "${pkgdir}/usr/bin"
  mv "zdl" "${pkgdir}/usr/bin/qzdl"
}

