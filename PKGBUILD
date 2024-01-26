# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

# shellcheck disable=SC2034,SC2164

pkgname='neovim-nightfox'
_projname='nightfox.nvim'
pkgver='3.9.2'
pkgrel=1
pkgdesc='Highly customizable Neovim theme with support for a variety of plugins'
arch=('any')
url="https://github.com/EdenEast/${_projname}"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install='neovim-nightfox.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4ddf019577d865583cf842e9e67fe7ab58c7073880bd81bc87e7e096f01de5c')

package() {
  pkgdir=${pkgdir:?}
  local dirs=(autoload colors doc extra lua misc plugin)
  local docs=(usage.md CHANGELOG.md)

  cd "${_projname}-${pkgver}"

  find "${dirs[@]}" \
    -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  for file in "${docs[@]}"; do
    install -Dvm644 "$file" -t "$pkgdir/usr/share/doc/$pkgname/"
  done
}

check() {
  cd "${_projname}-${pkgver}"
  make test
}
