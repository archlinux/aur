# Maintainer: Christoph Haag <haagch@frickel.club>
pkgname=glslang-svn
pkgver=r27423
pkgrel=1
pkgdesc="Glslang is the official reference compiler front end for the OpenGL ES and OpenGL shading languages."
arch=("i686" "x86_64")
url="http://www.khronos.org/opengles/sdk/tools/Reference-Compiler/"
license=('GPL')
groups=()
depends=()
makedepends=('subversion')
provides=("glslang")
source=("svn+https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/tools/glslang")
md5sums=("SKIP") #generate with 'makepkg -g'

build() {
  cd glslang
  #
  # BUILD HERE
  #
#  ./autogen.sh
#  ./configure --prefix=/usr
#  make

#! /bin/bash

svn update

#rm -f StandAlone/glslangValidator
#rm -f Test/glslangValidator
#rm -f glslang/MachineIndependent/lib/libglslang.so
#rm -f Install/Linux/libglslang.so
#rm -f Install/Linux/glslangValidator

#cd StandAlone
#make clean
#cd ../glslang/MachineIndependent
#make clean
#cd ../..

# build the StandAlone app and all it's dependencies
make -C StandAlone

# so we can find the shared library
#LD_LIBRARY_PATH=`pwd`/glslang/MachineIndependent/lib
#export LD_LIBRARY_PATH

# install
#cd Install/Linux
#./install
#cp glslangValidator ../../Test
#LD_LIBRARY_PATH=/usr/local/lib
#export LD_LIBRARY_PATH

# run using test data
#cd ../../Test
#chmod +x runtests
#./runtests


}

package() {
  cd glslang
  #make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/lib"
  install Install/Linux/libglslang.so "$pkgdir/usr/lib"
  install -m 755 Install/Linux/glslangValidator "$pkgdir/usr/bin"
}

pkgver() {
  cd "$srcdir/glslang"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}


# vim:set ts=2 sw=2 et:
