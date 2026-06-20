# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls
pkgver=0.1.0
pkgrel=2
pkgdesc='Nushell-style ls for bash, zsh, and fish'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
makedepends=('git' 'go')
source=("git+${url}.git#tag=v${pkgver}"
        'LICENSE')
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "${pkgname}"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags='-s -w' -o "${pkgname}" ./cmd/nls
}

check() {
  cd "${pkgname}"
  go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
