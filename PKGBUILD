# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=cariddi-git
_pkgname=${pkgname%-git}
pkgver=v1.1.2.r0.g24e120d
pkgrel=1
pkgdesc='A web reconnaissance tool'
arch=('x86_64')
url="https://github.com/edoardottt/cariddi"
license=('GPL-3.0')
makedepends=('go>=1.13')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-s -w -linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "${pkgname}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
