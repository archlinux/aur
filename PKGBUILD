# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO: Include docs!

pkgname='stratisd-git'
_gitname='stratisd'
pkgver=0.1.0.r7.g9204a4d
pkgrel=1
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('i686' 'x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('cargo' 'git' 'rust')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=('git+https://github.com/stratis-storage/stratisd.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"

  git describe --long --tags \
    | sed 's/v//'            \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"

  cargo build --release
}

check() {
  cd "${_gitname}"

  make test
}

package() {
  cd "${_gitname}"

  install -D -m 755 \
    target/release/${_gitname} "${pkgdir}/usr/bin/${_gitname}"
  install -D -m 644 \
    LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}

# vim: ts=2 sw=2 et:
