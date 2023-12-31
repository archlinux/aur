# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=vim-beancount-git
pkgdesc='Vim support for beancount accounting files'
pkgver=r105.25bcbc7
pkgrel=1
conflicts=('vim-beamcount')
provides=('vim-beamcount')
url='https://github.com/nathangrigg/vim-beancount'
arch=('any')
license=('custom:vim')

depends=('vim-plugin-runtime')
makedepends=('git')

source=(
  'git+https://github.com/nathangrigg/vim-beancount.git'
  'https://www.gnu.org/licenses/vim-license.txt'
)
sha256sums=(
  'SKIP'
  'cfc1edda2b488ecd5b4f1504ea74f5d4a3965d717b5051a51d968ca0b58b3e65'
)

pkgver() {
  cd vim-beancount
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd vim-beancount
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  local _component
  for _component in ale_linters/beancount autoload compiler doc ftdetect ftplugin indent syntax; do
    install -Dm644 -t "${_installpath}/${_component}" "${_component}"/*
  done

  install -Dm644 "${srcdir}/vim-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
