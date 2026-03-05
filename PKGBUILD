# Maintainer: Verivus Pty Ltd <hello@sqry.dev>
pkgname=sqry-bin
pkgver=4.8.16
pkgrel=2
pkgdesc='Semantic code search tool'
arch=('x86_64' 'aarch64')
url='https://sqry.dev'
license=('MIT')
provides=('sqry' 'sqry-mcp' 'sqry-lsp')
conflicts=('sqry' 'sqry-mcp' 'sqry-lsp')

source_x86_64=(
  "sqry-${pkgver}-x86_64::https://github.com/verivus-oss/sqry/releases/download/v${pkgver}/sqry-linux-x86_64"
  "sqry-mcp-${pkgver}-x86_64::https://github.com/verivus-oss/sqry/releases/download/v${pkgver}/sqry-mcp-linux-x86_64"
  "sqry-lsp-${pkgver}-x86_64::https://github.com/verivus-oss/sqry/releases/download/v${pkgver}/sqry-lsp-linux-x86_64"
)
source_aarch64=(
  "sqry-${pkgver}-aarch64::https://github.com/verivus-oss/sqry/releases/download/v${pkgver}/sqry-linux-arm64"
  "sqry-mcp-${pkgver}-aarch64::https://github.com/verivus-oss/sqry/releases/download/v${pkgver}/sqry-mcp-linux-arm64"
  "sqry-lsp-${pkgver}-aarch64::https://github.com/verivus-oss/sqry/releases/download/v${pkgver}/sqry-lsp-linux-arm64"
)
sha256sums_x86_64=(
  '12b8bb6327c386804a7c21a303b5312a0d38640d12f46956b7926358e935f284'
  'ae1d41f713f94a302fb6c3f0a29efec635371147977499e7dc95eac772b80063'
  '5897d802f9d56dcc034c4d8962a9263f39b3a85602accb2fb058a559737b6473'
)
sha256sums_aarch64=(
  '6876d83b4974ceed8bb898a8f0eabc1f0eaf795a9523877058393968c526b3c2'
  '8d02fc52337fdfc33ace8ffb05a8c86a7070417b45e7106248b55e3706842345'
  'd32a1ee621a934707481fa1fcb111a153b1f204b19ac188039955ad12f9cd5b7'
)

package() {
  local suffix
  case "${CARCH}" in
    x86_64)  suffix="x86_64" ;;
    aarch64) suffix="aarch64" ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  install -Dm755 "${srcdir}/sqry-${pkgver}-${suffix}" "${pkgdir}/usr/bin/sqry"
  install -Dm755 "${srcdir}/sqry-mcp-${pkgver}-${suffix}" "${pkgdir}/usr/bin/sqry-mcp"
  install -Dm755 "${srcdir}/sqry-lsp-${pkgver}-${suffix}" "${pkgdir}/usr/bin/sqry-lsp"
}
