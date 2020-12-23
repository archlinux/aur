# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: judd <jvinet@zeroflux.org>

_pkgbasename=libgpg-error
pkgname=lib32-$_pkgbasename-git
pkgver=1.41
pkgrel=1
pkgdesc="Support library for libgcrypt (32-bit)"
arch=(x86_64)
url="https://www.gnupg.org"
license=('LGPL')
depends=('lib32-glibc' $_pkgbasename)
provides=(lib32-libgpg-error)
conflicts=(lib32-libgpg-error)
source=(git://git.gnupg.org/libgpg-error.git)
sha512sums=('SKIP')

pkgver() {
   cd "libgpg-error"
   git describe --long --tags | sed 's/^gpgrt-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd libgpg-error
    ./autogen.sh  
    ./configure --enable-maintainer-mode --prefix=/usr --libdir=/usr/lib32 
  make
}

#check() {
#  cd "${srcdir}"/${_pkgbasename}-${pkgver}
#  make check
#}

package() {
  cd libgpg-error
  make DESTDIR="${pkgdir}/" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
