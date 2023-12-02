# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=moar
pkgver=1.18.5
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(x86_64)
url='https://github.com/walles/moar'
license=(BSD)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f130e496f04b0d295b468a3adc17c77c9af1d14ddc54e6001bc3bfabe2f8ee36')

build() {

   export CGO_CPPFLAGS="${CPPFLAGS}"
   export CGO_CFLAGS="${CFLAGS}"
   export CGO_CXXFLAGS="${CXXFLAGS}"
   export CGO_LDFLAGS="${LDFLAGS}"
   export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
   cd "${srcdir}/${pkgname}-${pkgver}"
   go build -ldflags="-s -w -X main.versionString=${pkgver}" -o "${pkgname}"
}

package() {

   cd "${srcdir}/${pkgname}-${pkgver}"

   install -Dm755 moar "${pkgdir}/usr/bin/${pkgname}"
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 moar.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
   install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
