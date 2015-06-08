# Contributor: core <angrycore@gmail.com>
# Maintainer Evgeniy "arcanis" Alekseev <esalexeev@gmail.com>

pkgname=qmmp-qsmmp-git
_gitname=qsmmp
pkgver=0.5.34.gcd1ca1a
pkgrel=1
pkgdesc="Amarok-like interface for qmmp. Git version"
arch=('i686' 'x86_64')
url="http://gitorious.org/qsmmp"
license=('GPL2')
depends=('qmmp' 'libqxt')
makedepends=('git')
source=(${_gitname}::git+https://gitorious.org/qsmmp/qsmmp.git#branch=qmmp-9999)
md5sums=('SKIP')

pkgver()
{
  cd "${_gitname}"
  local ver=`git describe --long`
  # because default ver is "qmmp.*"
  printf "%s" "${${ver//-/.}//qmmp./}"
}

build()
{
  cd "${srcdir}/${_gitname}"
  qmake-qt4 PREFIX=/usr
  make
}

package()
{
  cd "${srcdir}/${_gitname}"
  make INSTALL_ROOT="${pkgdir}" install
}
