# Maintainer: env252525@gmail.com
# Contributor: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-toml-git
pkgver=r76.2c8983c
pkgrel=1
epoch=1
pkgdesc="Vim syntax for TOML"
arch=('any')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
url="https://github.com/cespare/vim-toml"
license=('MIT')
source=("${pkgname%-git}::git+https://github.com/cespare/vim-toml#branch=main")
sha256sums=('SKIP')
provides=('vim-toml')
conflicts=('vim-toml')
install=vimdoc.install

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/vim-toml/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles"
  for _appdir in ftdetect syntax; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/vim/vimfiles/$_appdir"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
