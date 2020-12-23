# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sébastien Luttringer

_pkgname=lz4
pkgname=lib32-lz4-git
pkgver=1.9.3
pkgrel=1
pkgdesc='Extremely fast compression algorithm (32-bit)'
url='https://www.lz4.org/'
arch=('x86_64')
license=('GPL2')
makedepends=('git')
#checkdepends=('diffutils')
depends=('lz4' 'lib32-glibc')
provides=(lib32-lz4)
conflicts=(lib32-lz4)
source=("git+https://github.com/lz4/lz4.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
}

#check() {
#  rm -f passwd.lz4
#  ${_pkgname}/programs/lz4 /etc/passwd passwd.lz4
#  ${_pkgname}/programs/lz4 -d passwd.lz4 passwd
#  diff -q /etc/passwd passwd
#  rm passwd
#}

package() {
  cd ${_pkgname}
  make install \
    PREFIX=/usr \
    LIBDIR=/usr/lib32 \
    PKGCONFIGDIR=/usr/lib32/pkgconfig \
    DESTDIR="${pkgdir}"
  rm -rf "${pkgdir}"/usr/{share,include,bin}
}

# vim: ts=2 sw=2 et:
