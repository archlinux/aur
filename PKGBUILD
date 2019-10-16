# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Mizuchi <ytj000+AUR@gmail.com>

pkgname=vim-startify-git
pkgver=1.1.r243.g520f277
pkgrel=2
epoch=1
pkgdesc='A fancy start screen for Vim.'
arch=('any')
url='https://github.com/mhinz/vim-startify'
license=('MIT')
depends=('vim')
makedepends=('git')
conflicts=('vim-startify')
provides=('vim-startify')
groups=('vim-plugins')
source=("git+https://github.com/mhinz/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  # cutting off 'v' prefix from the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname%-git}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}/"{autoload,doc,plugin,syntax}
  install -m644 autoload/startify.vim "${_installpath}/autoload/"
  install -d "${_installpath}/autoload/startify"
  install -m644 autoload/startify/fortune.vim "${_installpath}/autoload/startify"
  install -m644 doc/startify.txt "${_installpath}/doc/"
  install -m644 plugin/startify.vim "${_installpath}/plugin/"
  install -m644 syntax/startify.vim "${_installpath}/syntax/"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
