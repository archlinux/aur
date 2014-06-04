# Maintainer: Daniel Perez <tuvistavie@gmail.com>

pkgname=git-crypt
pkgver=0.3
pkgrel=1
pkgdesc="transparent file encryption in git"
arch=('any')
url="http://www.agwa.name/projects/git-crypt/"
license=('unknown')
depends=('git' 'openssl')

_gitroot=https://github.com/AGWA/git-crypt.git
_gitname="git-crypt"

build() {
	cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build

	make
}

package() {
  mkdir ${pkgdir}/bin
  cd ${srcdir}/build
  make PREFIX=${pkgdir} install
}
