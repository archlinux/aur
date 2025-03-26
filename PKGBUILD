# Maintainer: Biggs <biggs at sergeantbiggs dot net>
# Contributor: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=openring
pkgver=1.0.1
pkgrel=2
pkgdesc="A webring for static site generators"
arch=('x86_64')
url="https://sr.ht/~sircmpwn/openring/"
conflicts=('openring')
provides=('openring')
license=('GPL3')
makedepends=('go')
source=("https://git.sr.ht/~sircmpwn/openring/archive/${pkgver}.tar.gz")
sha256sums=('9df83d980473fc85d5e8df8bf55e509a90751d6be32500a304216108da4d17ca')

prepare() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -o "${pkgname}"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSES"/* -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
