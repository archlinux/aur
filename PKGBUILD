# Contributor: Max Devaine <max@devaine.cz>

pkgname=openvsp-git
pkgver=20150503
pkgrel=1
pkgdesc='OpenVSP allows the user to create a 3D model of an aircraft defined by common engineering parameters.'
arch=(i686 x86_64)
url='http://www.openvsp.org'
license=('NASA OPEN SOURCE AGREEMENT VERSION 1.3')
makedepends=('cmake' 'git')
depends=('fltk' 'libxml2' 'glew')
provides=('')
conflicts=('')
groups=('')


source=("$pkgname"::'git+https://github.com/OpenVSP/OpenVSP.git')
md5sums=('SKIP')


prepare() {
    if [ -d "${srcdir}/$pkgname/build" ] ; then
        rm -fr "${srcdir}/$pkgname/build"
    fi
    
    mkdir "${srcdir}/$pkgname/build" 
}

build() {
   cd "$srcdir/$pkgname/build"
   cmake ../SuperProject \
   	-DCMAKE_PREFIX_PATH='/usr' \
        -DVSP_USE_SYSTEM_FLTK=1 \
        -DVSP_USE_SYSTEM_GLEW=1 \
        -DVSP_USE_SYSTEM_LIBXML2=1
   
   make || return 1
}

package() {
  cd "$srcdir/$pkgname/build/OpenVSP-prefix/src/OpenVSP-build"
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/opt/openvsp" -P cmake_install.cmake
}
