# Maintainer: Tobias Martin <tm-x at gmx dot net>

_pkgname=cni
pkgname=${_pkgname}-git
pkgver=r428.de002ff
pkgrel=1
pkgdesc="Specification and libraries for writing plugins to configure network interfaces in Linux containers"
arch=('i686' 'x86_64')
url="https://github.com/containernetworking/cni"
license=('apache')
makedepends=('git' 'go')
source=("${pkgname}::git+https://github.com/containernetworking/${_pkgname}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/opt/${_pkgname}/"
  cp -dr --no-preserve=ownership bin "${pkgdir}/opt/${_pkgname}/"

  mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
