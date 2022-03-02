# Maintainer: DanielNak <daniel@tee.cat>

_prgname=vim-razer
pkgname=neo${_prgname}-git
pkgver=v1.2.r11.gb19bdc1
pkgrel=3
pkgdesc="Makes RGB Razer keyboards change key colors to complement what you do in neovim."
arch=('any')
url='https://github.com/DanManN/vim-razer'
license=('GNU GPLv3')
depends=('neovim' 'python-neovim' 'python-openrazer')
makedepends=('git')
optdepends=('polychromatic')
conflicts=('neovim-razer')
provides=('neovim-razer')
groups=('neovim-plugins')
source=("git+https://github.com/DanManN/${_prgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_prgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${_prgname}"
  _installpath="${pkgdir}/usr/share/nvim/runtime"
  mkdir -p "${_installpath}"
  cp -r doc plugin "${_installpath}"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
