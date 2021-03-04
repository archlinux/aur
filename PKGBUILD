# Maintainer: lmartinez
pkgname=vim-devicons-git
_pkgname=${pkgname%-git}
pkgver=0.11.0.r123.g4d14cb8
pkgrel=1
pkgdesc="Adds file type icons to Vim plugins"
arch=('any')
url="https://github.com/ryanoasis/vim-devicons"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('nerd-fonts: standalone glyphs; any nerd-font package will suffice'
            'ttf-nerd-fonts'
            'otf-nerd-fonts')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$_pkgname"
  find autoload doc nerdtree_plugin plugin pythonx rplugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
