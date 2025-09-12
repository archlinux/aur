# Maintainer: Sean E. Russell <ser@ser1.net>

pkgname=mirror-go
pkgver=0.2.0
pkgrel=1
pkgdesc="A 12-Factor, dynamic, multi-host Go vanity server"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://hg.sr.ht/~ser/mirror"
license=(BSD 3-clause)
depends=(glibc)
makedepends=(go)
source=("mirror-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/mirror-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -s -w" \
    -buildmode=pie .
}

package() {
  cd "${srcdir}/mirror-v${pkgver}"

  install      -Dm755 mirror            "${pkgdir}"/usr/bin/mirror
  install      -Dm644 LICENSE           "${pkgdir}/usr/share/licenses/mirror/LICENSE"
  install      -Dm644 README.md         "${pkgdir}/usr/share/doc/mirror/README.md"
  install      -Dm644 CHANGELOG.md         "${pkgdir}/usr/share/doc/mirror/CHANGELOG.md"
}
sha256sums=('eafb921cfe4ec259214fa2f7c52b9c8fc907ac549f9cca469dc235e34adceeb4')
