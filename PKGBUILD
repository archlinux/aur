# Maintainer: lmartinez-mirror
# Contributor: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=vim-suda-git
pkgver=0.3.0.r0.gfbb138f
pkgrel=2
pkgdesc='Vim plugin for writing out files with sudo'
arch=('any')
url="https://github.com/lambdalisue/suda.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'sudo')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('suda-vim-git' 'neovim-suda-opt-git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
