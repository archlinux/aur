# Maintainer: Arnaud Renevier <arno@renevier.net>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.9.3
pkgrel=1
pkgdesc="Nvim Treesitter configurations and abstraction layer"
arch=(any)
url="https://github.com/nvim-treesitter/nvim-treesitter"
license=(Apache-2.0)
groups=(neovim-plugins)
depends=(
  curl
  gcc
  neovim
  tar
)
install=$pkgname.install
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('ee18f9e68f6432d93ee5231807366fcbdf42424b885e16164c864b6849b0142c275387e503b92079f4f8158b534dfd074795d976b42957cc7c12f22978ed9f4b')
b2sums=('a371afce27daf1cfeddfcf7cb10df8cfa307bb61605b59fe59a597b309cb7a32eeea1c1160a14f9adbdbeffca96ce63e33cccfc0ca7eff7942593732dfcccc2a')

package() {
  local dirs=(autoload doc lua plugin queries)

  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
