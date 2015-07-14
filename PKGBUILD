# Maintainer : Kevin Brubeck Unhammer <unhammer+dill@mm.st>
pkgname=python2-plop-git
pkgver=20130523
pkgrel=1
pkgdesc="Python Low-Overhead stack-sampling Profiler"
url="https://github.com/bdarnell/plop/"
license=('MIT')
arch=('any')
depends=('python2')
makedepends=('python2-distribute' 'git')
optdepends=('python2-tornado: for plop.viewer web server')

_gitroot=("git://github.com/bdarnell/plop.git")
_gitname=plop


build() {
  cd ${srcdir}/

  msg "Connecting to the GIT server...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin
    msg "The local files are updated..."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done."

  msg "Starting make for: ${pkgname}"

  if [[ -d ${srcdir}/${_gitname}-build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/${_gitname}-build
  fi

  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

  cd ${srcdir}/${_gitname}-build
}

package() {
  cd ${srcdir}/${_gitname}-build

  python2 setup.py install --root=$pkgdir
}

