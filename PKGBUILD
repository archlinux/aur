# Maintainer: DanielNak <daniel@tee.cat>

pkgname=vim-razer-git
pkgver=v1.2.r11.gb19bdc1
pkgrel=2
pkgdesc="Makes RGB Razer keyboards change key colors to complement what you do in vim."
arch=('any')
url='https://github.com/DanManN/vim-razer'
license=('GNU GPLv3')
depends=('vim' 'python-openrazer')
makedepends=('git')
optdepends=('polychromatic')
conflicts=('vim-razer')
provides=('vim-razer')
groups=('vim-plugins')
source=("git+https://github.com/DanManN/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${pkgname%-git}"
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  mkdir -p "${_installpath}"
  cp -r doc plugin "${_installpath}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
