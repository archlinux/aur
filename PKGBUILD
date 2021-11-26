# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgname=vim-sneak-git
pkgver=1.9.r6.g94c2de4
pkgrel=1
pkgdesc='Motion plugin for Vim'
arch=('any')
url='https://github.com/justinmk/vim-sneak'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

PURGE_TARGETS=('.gitignore')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  cd "$pkgname"
  find autoload doc plugin \
    -type f \
    -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set et sw=2 ts=2 tw=79:
