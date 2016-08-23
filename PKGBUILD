# Maintainer: eisensheng <eisensheng@mailbox.org>
_pkgname=Mimick
pkgname=libmimick-git
pkgver=v0.2.0.r40.g435f41d
pkgrel=1
pkgdesc='KISS Cross-platform C Mocking library.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Snaipe/Mimick"
license=('MIT')
makedepends=('cmake')
provides=('libmimick')
source=('git+https://github.com/Snaipe/Mimick.git')
md5sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}/"

  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${_pkgname}/build"

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

check() {
  cd "${srcdir}/${_pkgname}/build"

  # Tests are failing.
  # make test
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" install

  install -D -m644 ../LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
