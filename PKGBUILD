# Maintainer: Axilleas P <axilleas@archlinux.gr>

pkgname=python2-gitissius-git
pkgver=20111022
pkgrel=1
pkgdesc="A distributed bug tracker for git."
arch=(any)
url="http://gitissius.org"
license=('GPL3')
depends=('python2')
makedepends=('git' 'python2-distribute')
optdepends=('python2-colorama: for color support')
conflicts=('python2-gitissius')

_gitroot="https://github.com/glogiotatidis/gitissius.git"
_gitname="gitissius"

build() {

  cd "$srcdir"
  	msg "Connecting to GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

	msg "GIT checkout done"
	msg "Starting make..."

	git clone $srcdir/$_gitname $srcdir/$_gitname-build

	#fix python2 issues
	cd $srcdir/$_gitname-build/$_gitname
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' *.py 
	
	cd $srcdir/$_gitname-build/
	python2 setup.py install --root="${pkgdir}" -O1
} 
