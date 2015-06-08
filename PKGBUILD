# Contributor: Bruno Galeotti <bravox87 at gmail.com>
pkgname='python2-oauth2-git'
pkgver=20120313
pkgrel=1
pkgdesc='A fully tested, abstract interface to creating OAuth clients and servers.'
url='https://github.com/simplegeo/python-oauth2'
license='MIT'
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('git')
conflicts=('python-oauth2')
replaces=('python-oauth2')
provides=('python2-oauth2')
_gitroot='https://github.com/simplegeo/python-oauth2.git'
_gitname='python-oauth2'
source=()
md5sums=()

build() {
  cd ${srcdir}

  msg 'Connecting to GIT server....'

  if [ -d '${srcdir}/${_gitname}' ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg 'GIT checkout done or server timeout'

  if [ -d $_gitname-build ]; then
    msg 'Removing old build directory'
    rm -rf $_gitname-build
  fi

  msg 'Copying repository to another build directory'
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  
  msg 'Starting build'
  cd $srcdir/$_gitname-build
  
  msg 'Running setup.py'
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
} 
