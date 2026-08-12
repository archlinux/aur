# Maintainer: Pavel Olizko <contact@nolight.dev>

pkgname=nls
pkgver=0.13.0
pkgrel=1
pkgdesc='A modern ls with useful tables'
arch=('x86_64' 'aarch64')
url='https://github.com/nolight132/nls'
license=('MIT')
makedepends=('git' 'go')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  export CGO_ENABLED=0
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -ldflags='-s -w' -o "${pkgname}" ./cmd/nls
  "./${pkgname}" --completion bash --completion zsh --completion fish
}

package() {
  cd "${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
