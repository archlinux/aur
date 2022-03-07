# Maintainer: olddog <jeff@impcode.com>

pkgname=vim-tmux-navigator-git
pkgver=r72.9ca5bfe
pkgrel=1
pkgdesc='Seamless navigation between tmux panes and vim splits'
arch=('any')
url='https://github.com/christoomey/vim-tmux-navigator'
license=('MIT')
makedepends=('git')
groups=('vim-plugins')
depends=('tmux')
source=("git+https://github.com/christoomey/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r doc plugin "${_installpath}"

  # install license file
  install -D -m 0644 License.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install docs
  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}"

  # install example files
  install -D -m 0644 vim-tmux-navigator.tmux "${pkgdir}/usr/share/doc/${pkgname}"
}
