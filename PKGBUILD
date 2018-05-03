# Maintainer: Vincent Kobel (v@kobl.one)

_pkgname='gvisor'
pkgname="${_pkgname}-git"
pkgver=26.4603f97
pkgrel=1
pkgdesc="User-space kernel, sandboxed container runtime"
arch=('x86_64')
url='https://github.com/google/gvisor'
license=('Apache-2.0')
sha256sums=('SKIP')
source=(git+https://github.com/vkobel/gvisor.git)
provides=('runsc')
makedepends=('bazel' 'python')

build() {
  cd "${srcdir}/${_pkgname}"
  bazel build runsc 
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D ./bazel-bin/runsc/linux_amd64_pure_stripped/runsc "${pkgdir}/usr/bin/runsc"
}

