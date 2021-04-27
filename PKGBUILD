# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-mkdx-git
pkgver=1.10.0.r23.g7fc33a8
pkgrel=1
pkgdesc="Vim plugin that adds Markdown-related features"
arch=('any')
url="https://github.com/sidofc/mkdx"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
changelog=CHANGELOG.md
source=("$pkgname::git+$url"
        "https://raw.githubusercontent.com/sidofc/mkdx/master/CHANGELOG.md")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find after autoload doc ftplugin plugin ! -name '*.gif' \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
