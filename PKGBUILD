# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>
# Contributor: envolution

pkgname=sttr
pkgver=0.2.30
pkgrel=1
pkgdesc='cli app to perform various operations on string'
arch=('x86_64' 'aarch64')
url='https://github.com/abhimanyu003/sttr'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('64c4ddd6f84c99f197053e96c489dea48c0bd83a33dfdd69ab209653bc38b9c8')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o sttr
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 'sttr' -t "${pkgdir}/usr/bin"
  install -Dm755 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

