# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=vim-airline-themes-git
pkgver=r1452.cda3b5e
pkgrel=2
pkgdesc='A collection of themes for vim-airline'
arch=('any')
url='https://github.com/vim-airline/vim-airline-themes'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'vim-airline')
makedepends=('git')
conflicts=('vim-airline-themes')
provides=('vim-airline-themes')
source=("git+https://github.com/vim-airline/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname%-git}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
