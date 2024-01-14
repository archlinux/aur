# Maintainer: Anton Karmanov <a.karmanov@inventati.org>

# shellcheck disable=SC2034,SC2164

pkgname='neovim-nightfox'
_projname='nightfox.nvim'
pkgver='3.8.0'
pkgrel=1
pkgdesc='Highly customizable Neovim theme with support for a variety of plugins'
arch=('any')
url="https://github.com/EdenEast/${_projname}"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
install='neovim-nightfox.install'
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('edd268d432292587f3d1691f26a52c58')

package() {
  pkgdir=${pkgdir:?}
  local dirs=(autoload colors doc extra lua misc plugin test)
  local docs=(usage.md CHANGELOG.md)

  cd "${_projname}-${pkgver}"

  find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  for file in "${docs[@]}"; do
    install -Dvm644 "$file" -t "$pkgdir/usr/share/doc/$pkgname/"
  done
}

check() {
  cd "${_projname}-${pkgver}"
  make test
}
