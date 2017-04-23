# Maintainer: Lex Black <autumn-wind at web dot de>

pkgname='libscrypt-git'
gitname='libscrypt'
pkgver=1.21.r2.gf2b7923
pkgrel=1
pkgdesc='Shared library that implements scrypt() functionality - a replacement for bcrypt()'
arch=('i686' 'x86_64')
url='https://github.com/technion/libscrypt'
license=('BSD')
makedepends=('git')
provides=("${gitname}")
conflicts=("${gitname}")
source=('git+https://github.com/technion/libscrypt')
sha256sums=('SKIP')

pkgver() {
    cd "${gitname}"

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/v//'
}

build() {
    cd "${gitname}"

    CFLAGS="${CFLAGS} -fPIC"

    make
}

check() {
    cd "${gitname}"

    make check
}

package() {
  cd "${gitname}"

  make PREFIX='/usr' DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
