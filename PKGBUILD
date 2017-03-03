####### ORIGINALLY CLONED FROM ARCHLINUX GLEW PKGBUILD
## $Id: PKGBUILD 248262 2015-10-02 13:15:34Z foutrelis $
## Maintainer: Andreas Radke <andyrtr@archlinux.org>
## Contributor: Stéphane Gaudreault <stephane@archlinux.org>
## Contributor: SleepyDog
##########################################################
# Maintainer: mnovick1988
# 
# glew-git -
#
# PLEASE inform me of any changes or required patches to 
# this file. I will fix promptly. ~ mnovick1988
#
##########################################################
#
# Changes:
# 
# 20170302 - Added changes recommended by User "haagch"
#           (fix PKGVER, added python Specific vesion)
#
##########################################################

pkgname=glew-git
_pkgname=glew
pkgver=2.0.0.r26.g6ee72f2
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'glu')
makedepends=('python2')
provides=('glew' 'glew-git')
conflicts=('glew')
source=(git://github.com/nigels-com/glew.git)
sha1sums=('SKIP')

pkgver() {
cd "glew"
git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/glew.//g'
}

build() {
  cd ${_pkgname}
  
  cd auto
  make PYTHON=python2
  cd ../
  cmake build/cmake/.
  make
  
}

package() {
  cd ${_pkgname}

  install -D -m755 ${srcdir}/${_pkgname}/bin/glewinfo  ${pkgdir}/usr/bin/glewinfo
  install -D -m755 ${srcdir}/${_pkgname}/bin/visualinfo ${pkgdir}/usr/bin/visualinfo
  install -D -m755 ${srcdir}/${_pkgname}/include/GL/glew.h  ${pkgdir}/usr/include/GL/glew.h
  install -D -m755 ${srcdir}/${_pkgname}/include/GL/glxew.h ${pkgdir}/usr/include/GL/glxew.h
  install -D -m755 ${srcdir}/${_pkgname}/include/GL/wglew.h  ${pkgdir}/usr/include/GL/wglew.h
  install -D -m755 ${srcdir}/${_pkgname}/glew.pc ${pkgdir}/usr/lib/pkgconfig/glew.pc
  install -D -m755 ${srcdir}/${_pkgname}/glew.pc.in ${pkgdir}/usr/lib/pkgconfig/glew.pc.in
  install -D -m755 ${srcdir}/${_pkgname}/lib/libGLEW.a  ${pkgdir}/usr/lib/libGLEW.a
  install -D -m755 ${srcdir}/${_pkgname}/lib/libGLEW.so ${pkgdir}/usr/lib/libGLEW.so
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd ${pkgdir}/usr/lib/
  ln -s libGLEW.so libGLEW.so.13
  ln -s libGLEW.so.13 libGLEW.so.13.9 
  
}
