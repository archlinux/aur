# Maintainer: Mistan Khomdram <mistankhomdram@gmail.com>
pkgname=lazychad
pkgver=1.0.11
pkgrel=1
epoch=1
pkgdesc="An intelligent, highly-aesthetic Neovim wrapper built on NvChad"
arch=('any')
url="https://github.com/MistanKh/LazyChad"
license=('MIT')
depends=(
  'git' 'curl' 'tar' 'ripgrep' 'fd' 'bash' 'make' 'unzip' 'gcc'
  'ttf-jetbrains-mono-nerd'
  'nodejs' 'npm'
  'python' 'python-pynvim'
  'lua51' 'luarocks' 'lua-jsregexp'
  'wl-clipboard' 'xclip'
)
# neovim is optional, as in nfpm.yaml: 'lazychad-nvim' installs Neovim 0.12+
# to /usr/local, and a hard depend would tie LazyChad to the repo package.
optdepends=(
  'neovim: system Neovim (lazychad-deps installs 0.12+ to /usr/local)'
  'neovide: GUI frontend (lazychad-deps --gui)'
  'lazygit: terminal Git UI'
)
provides=('lchad')
install=lazychad.install
# Built from the tagged release; the AUR sync workflow fills in the checksum.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('516622c53a7645147ae9b9cb9e24b49476bf2cb00acded1abb486d1b0b733203')

package() {
  cd "$srcdir/LazyChad-$pkgver"

  # Install the wrapper binary
  install -Dm755 bin/lchad "$pkgdir/usr/bin/lchad"
  install -Dm755 bin/lazychad-deps "$pkgdir/usr/bin/lazychad-deps"
  install -Dm755 bin/lazychad-nvim "$pkgdir/usr/bin/lazychad-nvim"
  install -Dm755 bin/lazychad-uninstall "$pkgdir/usr/bin/lazychad-uninstall"

  # Install the Neovim configuration files
  install -dm755 "$pkgdir/usr/share/lazychad"
  cp -a init.lua lua .version "$pkgdir/usr/share/lazychad/"

  # Install documentation and license
  install -Dm644 README.md "$pkgdir/usr/share/doc/lazychad/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
