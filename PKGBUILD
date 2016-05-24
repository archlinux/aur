pkgname=('libvhdi')
_realname=libvhdi
pkgver=20160424
pkgrel=1
pkgdesc="Library and tools to access the Virtual Hard Disk (VHD) image format" 
url="https://github.com/libyal/libvhdi/"
arch=('any')
license=('LGPLv3+')

provides=('libvhdi' 'python2-libvhdi' 'python3-libvhdi')
depends=('python2' 'python' 'fuse')
makedepends=('python2' 'python' 'gcc' 'git' 'automake' 'autoconf' 'gettext' 'libtool' 'pkg-config' 'fuse')
source=(https://github.com/libyal/${_realname}/archive/${pkgver}.zip)

prepare() {
  cd $srcdir/${_realname}-${pkgver}

  ./synclibs.sh
  ./autogen.sh
}

build() {
  cd $srcdir/${_realname}-${pkgver}
  ./configure --prefix=/usr --enable-python2 --enable-python3
  make
}

#Check will break ./configure options
#check() {
#  cd $srcdir/${_realname}-${pkgver}
#  ./runtests.sh 
#}

package_libvhdi() {
  cd $srcdir/${_realname}-${pkgver}
  make DESTDIR=${pkgdir} install
}

#setup.py will break ./configure options
#package_python2-libvhdi() {
#  cd $srcdir/${_realname}-${pkgver}
#  python2 setup.py install --root="${pkgdir}"
#}

md5sums=('1e70dc38ab301c13f3dcef8913efd81f')
