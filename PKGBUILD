# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-wiki-git
pkgver=0.1.r163.g97aec64
pkgrel=1
pkgdesc="A wiki plugin for Vim"
arch=('any')
url="https://github.com/lervag/wiki.vim"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
optdepends=('vim-wiki-ft: Wiki filetype plugin')
provides=("${pkgname%-git}" 'vim-ctrlp-wiki' 'vim-coc-wiki' 'vim-unite-wiki')
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc plugin pythonx rplugin \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
