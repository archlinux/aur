# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

# shellcheck disable=SC2034,SC2164

pkgname='neovim-plenary'
_projname='plenary.nvim'
pkgver='0.1.4'
pkgrel=1
pkgdesc='A Lua library for Neovim plugins'
arch=('any')
url='https://github.com/nvim-lua/plenary.nvim'
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
conflicts=("${pkgname}-git")
source=("${_projname}_v${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('62f51167db195356a9135bb5bde438750d8acc9aa0bb6540ede40357750f7bd9')

package() {
  pkgdir="${pkgdir:?}"
  local dirs=(data doc lua plugin)
  local docs=(README.md POPUP.md TESTS_README.md)

  cd "${_projname}-${pkgver}"
  find "${dirs[@]}" -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/{}" \;
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  for file in "${docs[@]}"; do
    install -Dvm644 "$file" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  done
}

# FIXME scandir_spec fail on v0.1.4
# FIXME curl_spec requests outer hosts, skip?
#check() {
#  cd "${_projname}-${pkgver}"
#  make test
#}
