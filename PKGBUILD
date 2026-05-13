# Maintainer: James Walker <james@jameswalker.org.uk>
pkgname=modfetch-bin
_pkgname=modfetch
pkgver=0.8.0
pkgrel=1
pkgdesc="Robust CLI/TUI downloader for LLM and Stable Diffusion assets"
arch=('x86_64' 'aarch64')
url="https://github.com/jxwalker/modfetch"
license=('MIT')
provides=('modfetch')
conflicts=('modfetch')

source=("LICENSE::https://raw.githubusercontent.com/jxwalker/modfetch/v${pkgver}/LICENSE")
sha256sums=('73be8e0a20ff3b0a6991d6405d4d485e5ffc8dfb07a13a1f1b7afb081f57ee54')

source_x86_64=("${_pkgname}-${pkgver}-linux-amd64::https://github.com/jxwalker/modfetch/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
sha256sums_x86_64=('a7bbfb6ce482b91ab1a93eb3b3aa9618b1e61b943e078bf84befc0e3114c5e2a')

source_aarch64=("${_pkgname}-${pkgver}-linux-arm64::https://github.com/jxwalker/modfetch/releases/download/v${pkgver}/${_pkgname}_linux_arm64")
sha256sums_aarch64=('063f70619266d9a89ebf9178f412a50ae757977f9615d1fb8c3faa2e6771e150')

package() {
  local binary
  case "$CARCH" in
    x86_64)
      binary="${srcdir}/${_pkgname}-${pkgver}-linux-amd64"
      ;;
    aarch64)
      binary="${srcdir}/${_pkgname}-${pkgver}-linux-arm64"
      ;;
    *)
      echo "unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  install -Dm755 "$binary" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
