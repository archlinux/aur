# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=lbb
pkgver=0.10.4
pkgrel=1
pkgdesc="A CLI address book application for CardDAV servers and vcard (e.g. vdirsyncer) directries. (qcard fork)"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://git.sr.ht/~ser/lbb"
license=(GPLv3)
depends=(glibc)
makedepends=(go)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  CGO_ENABLED=0

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -s -w" \
    -buildmode=pie .
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -Dm755 lbb                 "${pkgdir}"/usr/bin/lbb
  install -Dm644 LICENSE             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md           "${pkgdir}/usr/share/doc/lbb/README.md"
  install -Dm644 CHANGELOG.md        "${pkgdir}/usr/share/doc/lbb/CHANGELOG.md"
  install -Dm644 config-sample.json  "${pkgdir}/usr/share/doc/lbb/config-sample.json"
}
sha256sums=('d7bab5d424cb2141ebf5a4fb222f5c0a091b0e1815c750a31a068c4b0fd7eff0')
