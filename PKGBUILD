# Maintainer: xpt <user.xpt@gmail.com>

pkgname=liggghts-lpp
pkgver=3.2
pkgrel=0
pkgdesc="Open Source Discrete Element Method Particle Simulation Software - Post Processing (Pizza.py)"
arch=('any')
url="https://github.com/CFDEMproject/LPP"
license=('GPL')
depends=('liggghts' 'python2-numpy') 
_gitroot=" https://github.com/CFDEMproject/LPP.git"
_gitname="LPP"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}
 package() {
  mkdir -p $pkgdir/usr/share/liggghts/lpp/{src,scripts}
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/doc/liggghts/lpp/
  mkdir -p $pkgdir/usr/share/liggghts/examples-lpp/files
  cd $srcdir/$_gitname
  
  install -Dm 755 src/* $pkgdir/usr/share/liggghts/lpp/src
  install -Dm 755 scripts/* $pkgdir/usr/share/liggghts/lpp/scripts
   install -Dm644 doc/* $pkgdir/usr/share/doc/liggghts/lpp/
   install -Dm644 examples/{*.py,README} $pkgdir/usr/share/liggghts/examples-lpp/
   install -Dm644 examples/files/* $pkgdir/usr/share/liggghts/examples-lpp/files
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/liggghts/lpp/LICENSE"
   install -Dm644 "README" "$pkgdir/usr/share/licenses/liggghts/lpp/README"
  echo -e '#! /bin/bash\npython2 /usr/share/liggghts/lpp/src/lpp.py $@' >  $pkgdir/usr/bin/liggghts-lpp
  echo -e '#! /bin/bash\npython2 /usr/share/liggghts/lpp/src/pizza.py $@' >  $pkgdir/usr/bin/pizza
} 

