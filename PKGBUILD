# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname='libscrypt-git'
_gitname='libscrypt'
pkgver=1.21.r2.gf2b7923
pkgrel=1
pkgdesc='Shared library that implements scrypt() functionality - a replacement for bcrypt()'
arch=('i686' 'x86_64')
url='https://github.com/technion/libscrypt'
license=('BSD')
makedepends=('git')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/technion/libscrypt.git')
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"

    git describe --long                     \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  \
        | sed 's/v//'
}

build() {
    cd "${_gitname}"

    CFLAGS="${CFLAGS} -fPIC"
    make
}

check() {
    cd "${_gitname}"

    make check
}

package() {
  cd "${_gitname}"

  make PREFIX='/usr' DESTDIR="${pkgdir}" install

  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
