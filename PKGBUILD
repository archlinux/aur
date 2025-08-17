# Maintainer: Atte Lautanala <atte@lautana.la>
# Contributor: Arnaud Renevier <arno@renevier.net>
# Contributor: David Runge <dvzrv@archlinux.org>

_name=nvim-treesitter
pkgname=neovim-nvim-treesitter
pkgver=0.10.0
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
b2sums=('6d2f0dcf8683ba36a333fd38a9634df3c97e9b2c882b64c6042dc716b62933fc821d5082089131344fd61d695353ba4361575c87d9ad40040aa21175229b0da8')

package() {
  local dirs=(autoload doc lua plugin queries)

  cd $_name-$pkgver
  find "${dirs[@]}" -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vdm 755 "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/parser"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
