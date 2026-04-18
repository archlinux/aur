pkgname=forgecode-fish
pkgver=0.1.1
pkgrel=1
pkgdesc='Fish-shell plugin for Forge colon-command workflows'
arch=('any')
url='https://github.com/OneNoted/forgecode.fish'
license=('Apache-2.0')
depends=('fish' 'fzf')
optdepends=(
  'fd: preferred file discovery backend for @ file completion'
  'forge: required Forge CLI backend'
)
conflicts=('forgecode-fish-git')
source=(
  "https://github.com/OneNoted/forgecode.fish/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('30605fb092b719283c365a7a18b11585bcf213db2b8dbb2ed1bd7b0d7cc20893')

package() {
  cd "${srcdir}/forgecode.fish-${pkgver}"

  install -dm755 \
    "${pkgdir}/usr/share/fish/vendor_conf.d" \
    "${pkgdir}/usr/share/fish/vendor_functions.d" \
    "${pkgdir}/usr/share/fish/vendor_completions.d" \
    "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 conf.d/forgecode.fish \
    "${pkgdir}/usr/share/fish/vendor_conf.d/forgecode.fish"
  install -Dm644 completions/forge.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/forge.fish"

  local fn
  for fn in functions/*.fish; do
    install -Dm644 "$fn" "${pkgdir}/usr/share/fish/vendor_functions.d/$(basename "$fn")"
  done

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local doc
  for doc in docs/*.md; do
    install -Dm644 "$doc" "${pkgdir}/usr/share/doc/${pkgname}/$(basename "$doc")"
  done
}
