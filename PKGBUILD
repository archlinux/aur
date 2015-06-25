# Maintainer: Daniel Micay <danielmicay@gmail.com>

pkgname=libseccomp-git
_pkgname=libseccomp
pkgver=2.1.1.r109.gb37a453
pkgrel=1
epoch=2
pkgdesc='Enhanced seccomp library'
arch=('i686' 'x86_64')
license=('LGPL2.1')
url='http://sourceforge.net/projects/libseccomp/'
depends=('glibc')
source=(git://git.code.sf.net/p/libseccomp/libseccomp)
md5sums=('SKIP')
provides=(libseccomp)
conflicts=(libseccomp)

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
   make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  #mkdir -m 0755 -p "$pkgdir/usr/share/doc/$_pkgname"

  #find . -maxdepth 1 -type f | grep -v "[a-z]" | while read somefile; do
    #install "$somefile" "$pkgdir/usr/share/doc/$_pkgname"
  #done
}
