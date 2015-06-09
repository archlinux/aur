# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=fstar-git
pkgver=20150609
pkgrel=1
pkgdesc='An ML-like language with a type system for program verification'
url='http://research.microsoft.com/en-us/projects/fstar/'
license=('Apache')
depends=('mono' 'fsharp' 'z3')
provides=('fstar')
arch=('i686' 'x86_64')
source="fstar"
md5sums=('33d49bff387dfe21e4e6a645cc88b231')

_gitroot="https://github.com/FStarLang/FStar"
_gitname="FStar"
build() {
  cd $startdir/src
  msg "Connecting to github.com GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd $startdir/src/$_gitname
  make -C src
}

package() {
  cd $startdir/src/$_gitname

  install -d -m755 $pkgdir/opt/fstar
  install -D -m755 $startdir/fstar $pkgdir/usr/bin/fstar
  cp -r bin/ doc/ examples/ lib/ $pkgdir/opt/fstar
}
