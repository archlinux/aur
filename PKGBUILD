# Maintainer: Sean E. Russell <ser@ser1.net> -> also the developer

pkgname=ostui
pkgver=0.2.1
pkgrel=1
pkgdesc="A terminal client for OpenSubsonic servers (stmps fork)"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://git.sr.ht/~ser/ostui"
license=(GPLv3)
depends=(glibc mpv)
makedepends=('go>=1.24.0')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-X main.Version=v${pkgver} -s -w" \
    -buildmode=pie .
}

check() {
  test "$(${pkgname} -version)" = "$pkgname v${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  install -Dm755 ostui               "${pkgdir}"/usr/bin/ostui
  install -Dm644 LICENSE             "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md           "${pkgdir}/usr/share/doc/ostui/README.md"
  install -Dm644 CHANGELOG.md        "${pkgdir}/usr/share/doc/ostui/CHANGELOG.md"
  install -Dm644 config-example.toml "${pkgdir}/usr/share/doc/ostui/config-example.toml"
}
sha256sums=('18bbba1648081edcd86a68d7ac904bbbf02403bb26c92c725e4e10f76aae9b1a')
