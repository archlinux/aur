# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=goda
pkgver=0.9.2
pkgrel=1
pkgdesc="Go Dependency Analysis toolkit"
arch=('x86_64')
url="https://github.com/loov/goda"
license=('MIT')
makedepends=('git' 'go')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
b2sums=('5b948e7a24a8c3d002eef4174d4e7a840ee3431ce354603ad549dfde72fa74baad3082eb52fb903fa3a166fce3e899318eb472c594a97e48aee1bbd796e62a3f')

build() {
  cd "${srcdir}/${pkgname}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.Version=${pkgver} -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o . ./...
}

package() {
  install -D -m 0755 -t "${pkgdir}/usr/bin" "${srcdir}/${pkgname}/${pkgname}"
  install -D -m 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${srcdir}/${pkgname}/LICENSE"
}
