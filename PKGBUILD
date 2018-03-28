# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Philipp Jaeger <pjaeger@physik.uni-kl.de>
# Contributor: Klaus Denker <kldenker@unix-ag.uni-kl.de>
pkgname=glpresenter
pkgbase=glpresenter
pkgver=0.3.4 
pkgrel=5
pkgdesc="A dual-screen OpenGL PDF presentation software"
arch=('i686' 'x86_64')
url="http://www.unix-ag.uni-kl.de/~kldenker/gl_presenter/"
license=('GPL')
groups=()
provides=()
makedepends=('git')
depends=('qt5-base' 'poppler' 'glu')
_gitroot="https://github.com/KLAU542/gl-presenter.git"
_gitname="gl-presenter"

build()
{
  cd ${srcdir}/
  msg "Connecting to the GIT server...."
  if [[ -d ${srcdir}/${_gitname} ]] ; then
    cd ${_gitname}
    git pull origin            
    msg "The local files are updated..."
  else								        
    git clone ${_gitroot}
    cd ${_gitname}
  fi									        
  msg "GIT checkout done."						
  msg "Starting make for: ${pkgname}" 
  qmake-qt5 -Wnone
  make
}
package() {
  cd $srcdir/${_gitname}
  mkdir -p $pkgdir/usr/bin
  mv gl-presenter $pkgdir/usr/bin/glpresenter
}
