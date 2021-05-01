# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-limelight-git
pkgver=r32.4412a84
pkgrel=3
pkgdesc='Hyperfocus-writing in Vim.'
arch=('any')
url='https://github.com/junegunn/limelight.vim'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-goyo: Complementary Vim plugin for a zen mode-like experience')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url"
        'LICENSE')
sha256sums=('SKIP'
            '595e5c7670f76137827109954edd66d57ff85ce6f79a7548ea5dd588a4e22f7f')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  find autoload plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
