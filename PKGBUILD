# Maintainer: Mistan Khomdram <mistankhomdram@gmail.com>
pkgname=lazychad
pkgver=1.4.4
pkgrel=1
pkgdesc="An intelligent, highly-aesthetic Neovim wrapper built on NvChad"
arch=('any')
url="https://github.com/MistanKh/LazyChad"
license=('MIT')
depends=(
  'neovim' 'git' 'ripgrep' 'fd' 'bash' 'make' 'unzip' 'gcc'
  'ttf-jetbrains-mono-nerd' 'neovide'

  'nodejs' 'npm' 
  'python' 'python-pip' 'python-pipx'
  'lazygit' 'lua51' 'luarocks' 'lua-jsregexp'
  'wl-clipboard' 'xclip'
)
provides=('lazychad' 'lchad')
conflicts=('lazychad')
install=lazychad.install
source=("git+https://github.com/MistanKh/LazyChad.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/LazyChad"

  # Install the wrapper binary
  install -Dm755 bin/lchad "$pkgdir/usr/bin/lchad"
  install -Dm755 bin/lazychad-deps "$pkgdir/usr/bin/lazychad-deps"

  # Install the Neovim configuration files
  install -dm755 "$pkgdir/usr/share/lazychad"
  cp -a init.lua lua .version "$pkgdir/usr/share/lazychad/"
  
  # Install documentation and license
  install -Dm644 README.md "$pkgdir/usr/share/doc/lazychad/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
