# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=libseccomp-git
_pkgname=libseccomp
pkgver=2.2.0.r179.g9e61fd7
pkgrel=1
pkgdesc='Enhanced seccomp library'
url=https://github.com/seccomp/libseccomp
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('glibc')
makedepends=('git')
provides=(libseccomp)
conflicts=(libseccomp)
source=(git+https://github.com/seccomp/libseccomp)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  ./autogen.sh
}

build() {
  cd $_pkgname

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
