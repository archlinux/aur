# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=analyticsrelationships-git
_pkgname=${pkgname%-git}
pkgver=r14.c920eed
pkgrel=1
pkgdesc='Get related domains / subdomains by looking at Google Analytics IDs'
arch=('x86_64')
url="https://github.com/Josue87/AnalyticsRelationships"
license=('GPL-3.0')
makedepends=('go>=1.13')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
