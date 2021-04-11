# Maintainer: lmartinez-mirror
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
pkgname=vim-goyo-git
pkgver=1.6.0.r37.ga865dec
pkgrel=2
pkgdesc='Distraction-free writing in Vim'
arch=('any')
url='https://github.com/junegunn/goyo.vim'
license=('MIT')
depends=('vim-plugin-runtime')
makedepends=('git')
conflicts=('vim-goyo')
provides=('vim-goyo')
source=("$pkgname::git+$url"
        "LICENSE")
sha256sums=('SKIP'
            '766b8d101c8d237f236e8727f0ee9c04efffb12316e084cf6340bb11ce112ccf')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}